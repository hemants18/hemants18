<script setup>
// const nodes = [
//   // { type: "start", label: "Start" },
//   { type: "text", label: "Text Message" },
//   { type: "image", label: "Image" },
//   { type: "media", label: "Media" },
//   { type: "button", label: "Buttons" },
//   { type: "list", label: "List" },
//   { type: "delay", label: "Delay" },
//   { type: "condition", label: "Condition" },
//   { type: "api", label: "API Call" },
//   { type: "end", label: "End" },
// ];

const nodes = [
  // { type: "start", label: "Start", icon: "la-play-circle" },
  { type: "text", label: "Text Message", icon: "la-sms" },
  { type: "button", label: "Buttons", icon: "la-mouse-pointer" },
  { type: "cta", label: "Call to Action", icon: "la-link" },
  // { type: "image", label: "Image", icon: "la-image" },
  { type: "media", label: "Media", icon: "la-photo-video" },
  { type: "list", label: "List", icon: "la-list" },
  { type: "location", label: "Location", icon: "la-globe" },
  { type: "contact", label: "Contact Card", icon: "la-id-card" },
  { type: "delay", label: "Delay", icon: "la-clock" },
  { type: "condition", label: "Condition", icon: "la-random" },
  // { type: "api", label: "API Call", icon: "la-plug" },
  { type: "end", label: "End", icon: "la-stop-circle" },
];

const onDragStart = (event, nodeType) => {
  event.dataTransfer.setData("nodeType", nodeType);
};
</script>

<template>
  <div class="p-4 bg-white h-full">
    <h3 class="font-bold mb-4">Nodes</h3>

    <div
      v-for="n in nodes"
      :key="n.type"
      draggable="true"
      @dragstart="onDragStart($event, n.type)"
      class="flex items-center space-x-3 p-2 mb-2 border rounded cursor-grab bg-gray-50 hover:bg-gray-100 transition"
    >
    <i :class="['la', n.icon, 'text-xl text-indigo-600']"></i>
      <span>{{ n.label }}</span>
    </div>
  </div>
</template>
