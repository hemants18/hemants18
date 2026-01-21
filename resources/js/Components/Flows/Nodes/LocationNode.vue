<script setup>
import { Handle, Position } from "@vue-flow/core";
import { usePage } from "@inertiajs/vue3";
import { ref, computed, watch, onMounted } from "vue";
import { GoogleMap, Marker } from "vue3-google-map";

const props = defineProps({
  id: String,
  data: Object
});

const collapsed = ref(false);
const toggleCollapse = () => (collapsed.value = !collapsed.value);

// --- Computed bindings to Vue Flow node data ---
const latitude = computed({
  get: () => Number(props.data.latitude) || 28.6139,
  set: v => props.data.updateNodeData(props.id, { latitude: Number(v) })
});

const longitude = computed({
  get: () => Number(props.data.longitude) || 77.2090,
  set: v => props.data.updateNodeData(props.id, { longitude: Number(v) })
});

const address = computed({
  get: () => props.data.address || "",
  set: v => props.data.updateNodeData(props.id, { address: v })
});

// Center for GoogleMap component
const mapCenter = computed(() => ({
  lat: latitude.value,
  lng: longitude.value
}));

// When user edits lat/lng manually → map updates automatically
watch([latitude, longitude], () => {
  props.data.updateNodeData(props.id, {
    latitude: latitude.value,
    longitude: longitude.value
  });
});

// Marker drag handler
const onMarkerDrag = (event) => {
  const newLat = event.latLng.lat();
  const newLng = event.latLng.lng();

  latitude.value = newLat;
  longitude.value = newLng;
};

let autocomplete = null;


const initAutocomplete = () => {
  const input = document.getElementById(`location-search-${props.id}`);

  if (!window.google || !window.google.maps) return;

  autocomplete = new google.maps.places.Autocomplete(input, {
    fields: ["geometry", "formatted_address"]
  });

  autocomplete.addListener("place_changed", () => {
    const place = autocomplete.getPlace();
    if (!place.geometry) return;

    const lat = place.geometry.location.lat();
    const lng = place.geometry.location.lng();

    latitude.value = lat;
    longitude.value = lng;
    address.value = place.formatted_address;
  });
};

onMounted(() => {
  setTimeout(initAutocomplete, 500);
});

const getValueByKey = (key) => {
    const config = computed(() => usePage().props.config);
    const found = config.value.find(item => item.key === key);
    return found ? found.value : '';
};

// copy / delete
const copyNode = () => props.data.copyNode({ id: props.id });
const deleteNode = () => props.data.deleteNode(props.id);
</script>



<template>
  <div
    class="flow-node relative overflow-hidden rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 300px; max-width: 380px;"
  >

    <!-- Top accent bar (same pattern as your other nodes) -->
    <div class="h-1.5 rounded-t-md bg-gradient-to-r from-green-500 to-teal-500"></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">

        <!-- Title + icon -->
        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-green-100 text-green-600">
            <i class="las la-map-marker-alt text-lg"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Location</div>
            <div class="text-xs text-gray-500">Send location to user</div>
          </div>
        </div>

        <!-- Action buttons -->
        <div class="flex space-x-1">
          <button @click="toggleCollapse" class="border p-1.5 rounded-md">
            <i :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"></i>
          </button>

          <button @click="copyNode" class="border p-1.5 rounded-md">
            <i class="las la-copy"></i>
          </button>

          <button
            @click="deleteNode"
            class="rounded-md border p-1.5 text-red-600 hover:bg-red-50"
          >
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <div v-show="!collapsed">

        <div class="mb-3">
          <label class="text-xs font-medium">Search Location</label>
          <input
            :id="`location-search-${id}`"
            type="text"
            class="w-full border rounded-md p-2 text-sm mt-1"
            placeholder="Search for a location..."
          />
        </div>

        <!-- Google Map -->
        <GoogleMap :api-key="getValueByKey('google_maps_api_key')" style="width: 100%; height: 150px" :center="mapCenter" :zoom="15">
          <Marker
            :options="{
              position: mapCenter,
              draggable: true
            }"
            @dragend="onMarkerDrag"
          />
        </GoogleMap>

        <hr>
        <hr>

        <!-- Lat / Lng -->
        <div class="grid grid-cols-2 gap-2 mb-3">
          <div>
            <label class="text-xs font-medium">Latitude</label>
            <input
              v-model="latitude"
              class="w-full border p-2 rounded-md text-sm"
            />
          </div>

          <div>
            <label class="text-xs font-medium">Longitude</label>
            <input
              v-model="longitude"
              class="w-full border p-2 rounded-md text-sm"
            />
          </div>
        </div>

        <!-- Address -->
        <div class="mb-3">
          <label class="text-xs font-medium">Address</label>
          <textarea
            v-model="address"
            rows="2"
            class="w-full border rounded-md p-2 text-sm mt-1"
            placeholder="Type or paste address..."
          ></textarea>
        </div>

      </div>
    </div>

    <Handle
      type="target"
      :position="Position.Left"
      class="!h-4 !w-4 !border-2 !border-white bg-gradient-to-r from-red-500 to-orange-500"
    />

    <Handle
      type="source"
      :position="Position.Right"
      class="!h-4 !w-4 !border-2 !border-white bg-gradient-to-r from-red-500 to-orange-500"
    />
  </div>
</template>
