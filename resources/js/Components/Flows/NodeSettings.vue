<script setup>
import { ref } from "vue";

const selectedNode = ref(null);
</script>

<template>
  <div class="p-4 bg-white h-full">
    <h3 class="font-bold mb-4">Node Settings</h3>

    <p v-if="!selectedNode" class="text-gray-500">
      Click a node to edit settings.
    </p>

    <div v-else>
      <label class="block mb-2">Message</label>
      <textarea class="w-full border p-2"></textarea>
    </div>
  </div>
</template>
