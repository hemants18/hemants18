<template>
  <div
    class="flow-node relative rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 320px; max-width: 400px"
  >
    <div class="h-1.5 bg-green-500 rounded-t-md"></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">

        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-blue-100 text-blue-600">
            <i class="las la-id-card-alt"></i>
          </div>
          <div class="text-sm font-medium">Contact Message</div>
        </div>


        <div class="flex space-x-1">
          <button @click="toggleCollapse" class="border p-1.5 rounded-md">
            <i :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"></i>
          </button>

          <button @click="copyNode" class="border p-1.5 rounded-md">
            <i class="las la-copy"></i>
          </button>

          <button
            @click="deleteNode"
            class="border p-1.5 rounded-md text-red-600"
          >
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>
        <div v-show="!collapsed">
            <button
              @click="addContact"
              class="text-blue-600 text-xs font-medium"
            >
            + Add Contact
            </button>
            <div
          v-for="(contact, index) in contacts"
          :key="index"
          class="border rounded-lg p-2 bg-gray-50 relative"
        >

          <div class="grid grid-cols-2 gap-2 mb-2">
            <input
              v-model="contact.first_name"
              placeholder="First name"
              class="bw-full border rounded-md p-2 text-sm mb-2"
            />

            <input
              v-model="contact.last_name"
              placeholder="Last name"
              class="bw-full border rounded-md p-2 text-sm mb-2"
            />
          </div>

          <div class="grid grid-cols-2 gap-2 mb-2">
            <input
              v-model="contact.email"
              placeholder="Email"
              class="bw-full border rounded-md p-2 text-sm mb-2"
            />

            <input
              v-model="contact.phone"
              placeholder="+91 9XXXXXXXXX"
              class="bw-full border rounded-md p-2 text-sm mb-2"
            />
          </div>

          <div class="grid grid-cols-2 gap-2 mb-2">
            <input
              v-model="contact.company"
              placeholder="Company (option)"
              class="bw-full border rounded-md p-2 text-sm mb-2"
            />

            <input
              v-model="contact.title"
              placeholder="Title (option)"
              class="bw-full border rounded-md p-2 text-sm mb-2"
            />
          </div>

          <!-- Remove button -->
          <button
            v-if="contacts.length > 1"
            @click="removeContact(index)"
            class="text-red-500 text-xs absolute top-1 right-2"
          >
            Remove
          </button>
        </div>
      </div>
    </div>
    <!-- Vue Flow Handles -->
    <Handle 
      type="target" 
      :position="Position.Left" 
      class="!bg-green-500"
    />

    <Handle 
      type="source" 
      :position="Position.Right" 
      class="!bg-blue-500"
    />

  </div>
</template>

<script setup>
import { ref, watch } from "vue";
import { Handle, Position } from "@vue-flow/core";

const props = defineProps({
  id: String,
  data: Object,
});

const contacts = ref(
  props.data?.contacts || [
    {
      first_name: "",
      last_name: "",
      email: "",
      phone: "",
      company: "",
      title: ""
    }
  ]
);

const addContact = () => {
  contacts.value.push({
    first_name: "",
    last_name: "",
    email: "",
    phone: "",
    company: "",
    title: ""
  });
};

const removeContact = (index) => {
  if (contacts.value.length > 1) {
    contacts.value.splice(index, 1);
  }
};

// Sync with Vue Flow node data
watch(
  contacts,
  (val) => {
    props.data.contacts = val;
  },
  { deep: true }
);

/* --------------- UI STATE --------------- */
const collapsed = ref(false);
const toggleCollapse = () => (collapsed.value = !collapsed.value);

const copyNode = () => props.data.copyNode({ id: props.id });
const deleteNode = () => props.data.deleteNode(props.id);
</script>
