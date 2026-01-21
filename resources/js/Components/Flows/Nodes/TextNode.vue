<script setup>
import { Handle, Position } from "@vue-flow/core";
import { ref, computed, watch } from "vue";

const props = defineProps({
  id: String,
  data: Object
});


const MAX_CHARS = 1000;

// use computed getter/setter bound to node data
const message = computed({
  get() {
    return props.data.message || "";
  },

  set(value) {
    props.data.updateNodeData(props.id, {
      message: value.slice(0, MAX_CHARS)
    });
  }
  
  // set(value) {
  //   if (value.length > MAX_CHARS) {
  //     value = value.slice(0, MAX_CHARS);
  //   }
  //   props.data.message = value;
  // }
});

const charCount = computed(() => message.value.length);

const collapsed = ref(false);
const toggleCollapse = () => {
  collapsed.value = !collapsed.value;
};

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
  <div class="flow-node trigger-node relative overflow-hidden rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 300px; max-width: 380px;"
  >

    <div 
      class="h-1.5 rounded-t-md bg-gradient-to-r from-red-500 to-orange-500"
    ></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">

        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-red-100 text-red-600">
            <i class="las la-comment-alt"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Text Message</div>
          </div>
        </div>

        <div class="flex space-x-1">
          <button @click="toggleCollapse" class="border p-1.5 rounded-md">
             <i :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"></i>
          </button>

          <button @click="copyNode" class="border p-1.5 rounded-md">
            <i class="las la-copy"></i>
          </button>


          <button @click="deleteNode" class="rounded-md border p-1.5 text-red-600 hover:bg-red-50">
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <div v-show="!collapsed">

        <div class="mb-4">
          <label class="text-xs font-medium">Message *</label>
          <textarea
            v-model="message"
            class="w-full border rounded-md p-2 text-sm mt-1"
            rows="4"
            maxlength="1000"
          ></textarea>

          <div
            class="mt-1 text-xs flex justify-end"
            :class="charCount >= MAX_CHARS ? 'text-red-600' : 'text-gray-500'"
          >
            {{ charCount }} / {{ MAX_CHARS }} characters
          </div>
        </div>

      </div>
    </div>

    <Handle
      type="target"
      id = "input"
      :position="Position.Left"
      class="!bg-orange-500"
    />
    <Handle
      type="source"
      id = "output"
      :position="Position.Right"
      class="!bg-blue-500"
    />
  </div>
</template>
