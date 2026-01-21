<script setup>
import { Handle, Position } from "@vue-flow/core";
import { ref, computed } from "vue";

const props = defineProps({
  id: String,
  data: {
    type: Object,
    default: () => ({
      delayValue: 5,
      delayUnit: "minutes",
      updateNodeData: null,
      deleteNode: null,
      copyNode: null,
    }),
  },
});

const collapsed = ref(false);
const toggleCollapse = () => {
  collapsed.value = !collapsed.value;
};

// Delay value (two-way via Vue Flow)
const delayValue = computed({
  get() {
    return props.data.delayValue ?? 5;
  },
  set(val) {
    props.data.updateNodeData(props.id, {
      delayValue: Number(val),
    });
  },
});

const delayUnit = computed({
  get() {
    return props.data.delayUnit ?? "minutes";
  },
  set(val) {
    props.data.updateNodeData(props.id, {
      delayUnit: val,
    });
  },
});

// COPY NODE
const copyNode = () => {
  props.data.copyNode({ id: props.id });
};

// DELETE NODE
const deleteNode = () => {
  props.data.deleteNode(props.id);
};
</script>

<template>
  <div
    class="flow-node relative overflow-hidden rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 300px; max-width: 380px;"
  >
    <!-- Top accent -->
    <div
      class="h-1.5 rounded-t-md bg-gradient-to-r from-blue-500 to-indigo-500"
    ></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">
        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-blue-100 text-blue-600">
            <i class="las la-clock"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Delay</div>
            <span
              class="bg-blue-100 px-2 py-0.5 text-xs rounded-full text-blue-700"
            >
              Wait before next step
            </span>
          </div>
        </div>

        <div class="flex space-x-1">
          <button
            @click="toggleCollapse"
            class="border p-1.5 rounded-md"
          >
            <i
              :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"
            ></i>
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

      <div v-show="!collapsed" class="space-y-4">
        <div>
          <label class="text-xs font-medium">Delay Time *</label>

          <div class="flex gap-2 mt-1">
            <input
              type="number"
              min="1"
              class="w-1/2 border rounded-md p-2 text-sm"
              v-model="delayValue"
            />

            <select
              v-model="delayUnit"
              class="w-1/2 border rounded-md p-2 text-sm"
            >
              <option value="seconds">Seconds</option>
              <option value="minutes">Minutes</option>
              <option value="hours">Hours</option>
            </select>
          </div>
        </div>

        <div class="text-xs text-gray-500 italic">
          The flow will wait
          <strong>{{ delayValue }} {{ delayUnit }}</strong>
          before continuing.
        </div>
      </div>
    </div>

    <!-- INPUT -->
    <Handle
      type="target"
      id="input"
      :position="Position.Left"
      class="!bg-orange-500"
    />

    <!-- OUTPUT -->
    <Handle
      type="source"
      id="output"
      :position="Position.Right"
      class="!bg-blue-500"
    />
  </div>
</template>

<style scoped>
.flow-node {
  cursor: grab;
}
</style>
