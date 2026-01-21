<script setup>
import { Handle, Position } from '@vue-flow/core'
import { computed, ref } from 'vue'

const props = defineProps({
  id: String,
  data: { type: Object, required: true }
})

/* ---------- LIMITS ---------- */
const MAX_HEADER = 60
const MAX_VALUE = 1000
const MAX_BUTTON = 20
const MAX_FOOTER = 60

/* ---------- FIELDS (Vue Flow safe) ---------- */
const header = computed({
  get: () => props.data.header || '',
  set: v => props.data.updateNodeData(props.id, { header: v.slice(0, MAX_HEADER) })
})

const valueText = computed({
  get: () => props.data.valueText || '',
  set: v => props.data.updateNodeData(props.id, { valueText: v.slice(0, MAX_VALUE) })
})

const buttonText = computed({
  get: () => props.data.buttonText || 'Click Here',
  set: v => props.data.updateNodeData(props.id, { buttonText: v.slice(0, MAX_BUTTON) })
})

const buttonLink = computed({
  get: () => props.data.buttonLink || '',
  set: v => props.data.updateNodeData(props.id, { buttonLink: v })
})

const footer = computed({
  get: () => props.data.footer || '',
  set: v => props.data.updateNodeData(props.id, { footer: v.slice(0, MAX_FOOTER) })
})

/* ---------- COUNTS ---------- */
const headerCount = computed(() => header.value.length)
const valueCount = computed(() => valueText.value.length)
const buttonCount = computed(() => buttonText.value.length)
const footerCount = computed(() => footer.value.length)

/* ---------- VALIDATION ---------- */
const errors = computed(() => {
  const e = []
  if (!valueText.value.trim()) e.push('Value text is required')
  if (!buttonText.value.trim()) e.push('Button text is required')
  if (!buttonLink.value.trim()) e.push('Valid button link is required')
  return e
})


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
    style="min-width: 300px; max-width: 380px;">
     <div 
      class="h-1.5 rounded-t-md bg-gradient-to-r from-red-500 to-orange-500"
    ></div>
      
    <!-- Body -->
    <div class="p-4">

      <!-- Header -->
      <div class="flex items-center justify-between mb-3">

        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-red-100 text-red-600">
            <i class="las la-external-link-alt"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Call to Action</div>
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

      <!-- <div>
        <div class="font-medium text-sm"></div>
        <div v-if="errors.length" class="text-xs text-red-500">
          Required fields missing
        </div>
      </div> -->
   

    <!-- Errors -->
    <div
      v-show="!collapsed"
      v-if="errors.length"
      class="m-3 border border-red-300 bg-red-50 rounded-md p-3 text-sm"
    >
      <div class="font-medium text-red-600 mb-1">
        Please fix the following issues:
      </div>
      <ul class="list-disc list-inside text-red-600">
        <li v-for="(e, i) in errors" :key="i">{{ e }}</li>
      </ul>
    </div>    

      <!-- Header -->
      <div v-show="!collapsed">
        <label class="text-xs font-medium">Header (Optional)</label>
        <input
          v-model="header"
          class="w-full border rounded-md p-2 text-sm mt-1"
          placeholder="Enter header text (optional)"
        />
        <div class="text-xs text-right text-gray-400">
          {{ headerCount }}/{{ MAX_HEADER }}
        </div>
      </div>

      <!-- Value Text -->
      <div v-show="!collapsed">
        <label class="text-xs font-medium text-red-600">
          Value Text *
        </label>
        <textarea
          v-model="valueText"
          rows="3"
          class="w-full border rounded-md p-2 text-sm mt-1"
          placeholder="Enter value text"
        />
        <div class="text-xs text-right text-gray-400">
          {{ valueCount }}/{{ MAX_VALUE }}
        </div>
        <div v-if="!valueText" class="text-xs text-red-500">
          Value text is required
        </div>
      </div>

      <!-- Button Text -->
      <div v-show="!collapsed">
        <label class="text-xs font-medium text-red-600">
          Button Text *
        </label>
        <input
          v-model="buttonText"
          class="w-full border rounded-md p-2 text-sm mt-1"
          placeholder="Click Here"
        />
        <div class="text-xs text-right text-gray-400">
          {{ buttonCount }}/{{ MAX_BUTTON }}
        </div>
      </div>

      <!-- Button Link -->
      <div v-show="!collapsed">
        <label class="text-xs font-medium text-red-600">
          Button Link *
        </label>
        <input
          v-model="buttonLink"
          class="w-full border rounded-md p-2 text-sm mt-1"
          placeholder="Enter URL (https://example.com)"
        />
        <div v-if="!buttonLink" class="text-xs text-red-500">
          Please enter a valid URL
        </div>
      </div>

      <!-- Footer -->
      <div v-show="!collapsed">
        <label class="text-xs font-medium">Footer (Optional)</label>
        <input
          v-model="footer"
          class="w-full border rounded-md p-2 text-sm mt-1"
          placeholder="Enter footer text (optional)"
        />
        <div class="text-xs text-right text-gray-400">
          {{ footerCount }}/{{ MAX_FOOTER }}
        </div>
      </div>

      <!-- Preview -->
      <div v-show="!collapsed" class="border rounded-md p-3 bg-gray-50">
        <div class="text-xs font-medium mb-2">Preview:</div>

        <div class="text-xs mb-2">
          {{ header }}
        </div>
        <div class="text-sm mb-2">
          {{ valueText || 'Your value text will appear here' }}
        </div>

        <button
          class="w-full py-2 rounded-md bg-yellow-500 text-white text-sm"
        >
          {{ buttonText }}
        </button>

        <div class="text-xs mb-2">
          {{ footer }}
        </div>
      </div>

    </div>

    <!-- Handles -->
    <Handle
      type="target"
      id = "input"
      :position="Position.Left"
      class="!w-4 !h-4 bg-orange-500"
    />

    <Handle
      type="source"
      id = "output"
      :position="Position.Right"
      class="!w-4 !h-4 bg-orange-500"
    />
  </div>
</template>
