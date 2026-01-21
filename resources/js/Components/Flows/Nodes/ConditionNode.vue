<script setup>
import { Handle, Position } from "@vue-flow/core";
import { computed, ref } from "vue";

const props = defineProps({
  id: String,
  data: {
    type: Object,
    default: () => ({
      conditions: [],
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

// CONDITIONS (two-way)
const conditions = computed({
  get() {
    return props.data.conditions || [];
  },
  set(val) {
    props.data.updateNodeData(props.id, {
      conditions: val,
    });
  },
});

// Add new condition
const addCondition = () => {
  conditions.value = [
    ...conditions.value,
    {
      field: "message",
      operator: "contains",
      value: "",
    },
  ];
};

// Remove condition
const removeCondition = (index) => {
  const updated = [...conditions.value];
  updated.splice(index, 1);
  conditions.value = updated;
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
  <div
    class="flow-node relative overflow-hidden rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 320px; max-width: 400px;"
  >
    <!-- Top Accent -->
    <div class="h-1.5 rounded-t-md bg-gradient-to-r from-yellow-500 to-orange-500"></div>

    <div class="p-4">
      <!-- Header -->
      <div class="flex items-center justify-between mb-3">
        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-yellow-100 text-yellow-700">
            <i class="las la-code-branch"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Condition</div>
            <span class="text-xs bg-yellow-100 px-2 py-0.5 rounded-full">
              If / Else logic
            </span>
          </div>
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
            class="border p-1.5 rounded-md text-red-600 hover:bg-red-50"
          >
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <!-- Body -->
      <div v-show="!collapsed" class="space-y-3">
        <div
          v-for="(cond, index) in conditions"
          :key="index"
          class="border rounded-md p-3 space-y-2"
        >
          <div class="flex gap-2">
            <select
              v-model="cond.field"
              class="w-1/3 border rounded-md p-1.5 text-sm"
            >
              <option value="message">Message</option>
              <option value="contact_name">Contact Name</option>
              <option value="phone">Phone</option>
            </select>

            <select
              v-model="cond.operator"
              class="w-1/3 border rounded-md p-1.5 text-sm"
            >
              <option value="contains">Contains</option>
              <option value="equals">Equals</option>
              <option value="starts_with">Starts with</option>
            </select>

            <input
              v-model="cond.value"
              type="text"
              placeholder="Value"
              class="w-1/3 border rounded-md p-1.5 text-sm"
            />
          </div>

          <button
            @click="removeCondition(index)"
            class="text-xs text-red-500 hover:underline"
          >
            Remove
          </button>
        </div>

        <button
          @click="addCondition"
          class="w-full border border-dashed rounded-md p-2 text-sm text-gray-600 hover:bg-gray-50"
        >
          + Add Condition
        </button>
      </div>
    </div>

    <!-- TRUE -->
    <Handle
      type="source"
      id="true"
      :position="Position.Right"
      class="!h-4 !w-4 !border-2 !border-white bg-green-500 rounded-full"
    />

    <!-- FALSE -->
    <Handle
      type="source"
      id="false"
      :position="Position.Bottom"
      class="!h-4 !w-4 !border-2 !border-white bg-red-500 rounded-full"
    />

    <!-- INPUT -->
    <Handle
      type="target"
      id="input"
      :position="Position.Left"
      class="!h-4 !w-4 !border-2 !border-white bg-yellow-500 rounded-full"
    />
  </div>
</template>

<style scoped>
.flow-node {
  cursor: grab;
}
</style>
