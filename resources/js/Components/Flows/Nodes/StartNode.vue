<script setup>
import { Handle, Position } from "@vue-flow/core";
import { ref } from "vue";
import { trans } from 'laravel-vue-i18n';

const props = defineProps({
  id: String,
  data: {
    type: Object,
    default: () => ({
      keywords: [],
      updateNodeData: null,
      deleteNode: null,
      copyNode: null
    })
  }
});

const selectedCriteria = ref(props.data.criteria || '');

const criteriaOptions = ref([
    { value: 'exact match', label: trans('When text is an exact match to trigger text') },
    { value: 'contains', label: trans('When text contains trigger text') },
])

const newKeyword = ref("");
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

// ADD KEYWORD
const addKeyword = () => {
  const kw = newKeyword.value.trim();
  if (!kw) return;

  const existing = Array.isArray(props.data.keywords)
    ? props.data.keywords
    : [];

  const updatedKeywords = [...existing, kw];

  props.data.updateNodeData(props.id, {
    keywords: updatedKeywords
  });

  newKeyword.value = "";
};

// REMOVE KEYWORD
const removeKeyword = (kw) => {
  const existing = Array.isArray(props.data.keywords)
    ? props.data.keywords
    : [];

  const updatedKeywords = existing.filter(k => k !== kw);

  props.data.updateNodeData(props.id, {
    keywords: updatedKeywords
  });
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
            <i class="las la-walking"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Start Trigger</div>
            <span class="bg-purple-100 px-2 py-0.5 text-xs rounded-full">
              Entry Point
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

          <button v-if="!props.data.isPrimary" @click="deleteNode" class="rounded-md border p-1.5 text-red-600 hover:bg-red-50">
            <i class="las la-trash-alt"></i>
          </button>

          <button v-else disabled class="border p-1.5 rounded-md bg-gray-100 text-gray-300">
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <div v-show="!collapsed">

        <div class="mb-4">
          <label class="text-xs font-medium">Trigger Type *</label>

          <select 
            v-model="selectedCriteria"
            @change="props.data.updateNodeData(props.id, { criteria: selectedCriteria })"
            class="w-full border rounded-md p-2 text-sm mt-1"
          >
            <option value="" disabled>Select criteria</option>

            <option 
              v-for="val in criteriaOptions"
              :key="val.value"
              :value="val.value"
            >
              {{ val.label }}
            </option>
          </select>
        </div>


        <div class="mb-4">
          <label class="text-xs font-medium text-gray-700">
            Trigger Keywords *
          </label>

          <div class="flex mb-3 mt-2">
            <input 
              v-model="newKeyword"
              type="text"
              placeholder="Add a keyword..."
              class="w-full border rounded-l-md px-3 py-2 text-sm"
            />
            <button 
              @click="addKeyword"
              class="bg-purple-600 text-white px-3 rounded-r-md"
            >
              +
            </button>
          </div>

          <div class="flex flex-wrap gap-2">
            <div 
              v-for="k in props.data.keywords"
              :key="k"
              class="flex items-center rounded-full bg-purple-100 px-3 py-1.5 text-xs"
            >
              {{ k }}
              <button @click="removeKeyword(k)" class="ml-1">×</button>
            </div>
          </div>
        </div>

      </div>
    </div>

    <Handle
      type="source"
      id = "output"
      :position="Position.Right"
      class="!bg-orange-500"
    />
  </div>
</template>
