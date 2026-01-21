<script setup>
import AppLayout from '../Layout/App.vue';
import NodeSidebar from "@/Components/Flows/NodeSidebar.vue";
import FlowCanvas from "@/Components/Flows/FlowCanvas.vue";
import NodeSettings from "@/Components/Flows/NodeSettings.vue";

defineProps({
  flow: Object,
});
</script>

<template>
<AppLayout>
  <div class="h-screen flex flex-col">
    <!-- Top bar -->
    <div class="p-4 border-b bg-white flex justify-between items-center">
      <h1 class="font-bold text-lg">
        Editing Flow: {{ flow.name }}
      </h1>

      <button class="bg-blue-600 text-white px-4 py-2 rounded">
        Save Flow
      </button>
    </div>

    <!-- Main 3-panel layout -->
    <div class="flex flex-1">
      <!-- Left Sidebar -->
      <NodeSidebar class="w-1/5 border-r" />

      <!-- Center Canvas -->
      <FlowCanvas class="w-3/5 bg-gray-50" />

      <!-- Right Settings -->
      <!-- <NodeSettings class="w-1/5 border-l" /> -->
    </div>
  </div>
</AppLayout>
</template>
