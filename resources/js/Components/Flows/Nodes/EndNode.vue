<script setup>
import { Handle, Position } from "@vue-flow/core";
import { ref } from "vue";

const props = defineProps({
  id: String,
  data: Object,
});

const collapsed = ref(false);
const toggleCollapse = () => (collapsed.value = !collapsed.value);

// actions come from sharedNodeActions in flowCanvas.vue
const copyNode = () => props.data.copyNode({ id: props.id });
const deleteNode = () => props.data.deleteNode(props.id);
</script>

<template>
  <div
    class="flow-node relative overflow-hidden rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 280px; max-width: 360px;"
  >
    <!-- Top accent bar -->
    <div
      class="h-1.5 rounded-t-md bg-gradient-to-r from-gray-700 to-black"
    ></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">
        <!-- Title -->
        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-gray-100 text-gray-700">
            <i class="las la-stop-circle text-lg"></i>
          </div>

          <div>
            <div class="text-sm font-medium">End Flow</div>
            <div class="text-xs text-gray-500">
              This stops the conversation
            </div>
          </div>
        </div>

        <!-- Action buttons -->
        <div class="flex space-x-1">
          <button
            @click="toggleCollapse"
            class="border p-1.5 rounded-md"
            title="Collapse"
          >
            <i :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"></i>
          </button>

          <button
            @click="copyNode"
            class="border p-1.5 rounded-md"
            title="Duplicate node"
          >
            <i class="las la-copy"></i>
          </button>

          <button
            @click="deleteNode"
            class="rounded-md border p-1.5 text-red-600 hover:bg-red-50"
            title="Delete node"
          >
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <div v-show="!collapsed">
        <div
          class="rounded-md border border-gray-200 bg-gray-50 p-3 text-sm text-gray-700"
        >
          <p class="font-medium mb-1">Flow will stop here.</p>
          <p class="text-xs">
            No further messages will be sent after this node.
          </p>
        </div>
      </div>
    </div>

    <!-- Input only (End node has NO output handle) -->
    <Handle
      type="target"
      :position="Position.Left"
      class="!bg-orange-500"
    />
  </div>
</template>

<style scoped>
.flow-node {
  cursor: grab;
}
</style>
