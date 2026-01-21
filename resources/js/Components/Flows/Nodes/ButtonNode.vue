<script setup>
import { Handle, Position } from '@vue-flow/core'
import { computed, ref } from 'vue'

const props = defineProps({
  id: String,
  data: { 
    type: Object, 
    required: true
  }
})

/* ---------- CONSTANTS ---------- */
const MAX_MESSAGE_CHARS = 1024
const MAX_BUTTONS = 3
const MAX_BUTTON_TEXT = 20

/* ---------- MESSAGE ---------- */
const message = computed({
  get: () => props.data.message || '',
  set: (val) => {
    props.data.updateNodeData(props.id, {
      message: val.slice(0, MAX_MESSAGE_CHARS)
    })
  }
})

const messageCount = computed(() => message.value.length)

/* ---------- BUTTONS ---------- */
const buttons = computed(() => props.data.buttons || [])
const getButtonHandleId = (index) => `button-${index}`;

const addButton = () => {
  if (buttons.value.length >= MAX_BUTTONS) return

  props.data.updateNodeData(props.id, {
    buttons: [
      ...buttons.value,
      { text: '', value: '', connected: false }
    ]
  })
}

const removeButton = (index) => {
  const handleId = getButtonHandleId(index);

  props.data.removeButtonEdges(props.id, handleId);

  const updated = [...buttons.value];
  updated.splice(index, 1);

  props.data.updateNodeData(props.id, { buttons: updated });
};

const updateButton = (index, key, value) => {
  const updated = [...buttons.value]
  updated[index][key] =
    key === 'text' ? value.slice(0, MAX_BUTTON_TEXT) : value
  props.data.updateNodeData(props.id, { buttons: updated })
}


const onConnect = (connection) => {

  const buttonIndex = connection.sourceHandle?.replace("button-", "");

  if (buttonIndex !== undefined) {
    updateNodeData(connection.source, {
      buttons: nodes.value
        .find(n => n.id === connection.source)
        .data.buttons.map((b, i) =>
          i == buttonIndex ? { ...b, connected: true } : b
        )
    });
  }

};

/* ---------- VALIDATION ---------- */
const errors = computed(() => {
  const errs = []

  if (!message.value.trim()) {
    errs.push('Message text is required')
  }

  if (
    buttons.value.some(
      (b) => !b.text.trim() || !b.value.trim()
    )
  ) {
    errs.push('All buttons must have text and value')
  }

  if (buttons.value.some((b) => !b.connected)) {
    errs.push('All buttons must be connected to another node')
  }

  return errs
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
    style="min-width: 300px; max-width: 380px;"
  >

    <div 
      class="h-1.5 rounded-t-md bg-gradient-to-r from-red-500 to-orange-500"
    ></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">

        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-red-100 text-red-600">
            <i class="las la-caret-square-up"></i>
          </div>

          <div>
            <div class="text-sm font-medium">Button Message</div>
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
          <label class="text-xs font-medium">Message Text *</label>
          <textarea
            v-model="message"
            rows="3"
            class="w-full border rounded-md p-2 text-sm mt-1"
          />

          <div class="text-xs text-gray-500 text-right">
           {{ messageCount }}/{{ MAX_MESSAGE_CHARS }}
          </div>
        </div>

        <div>
        <div class="flex justify-between items-center mb-2">
          <span class="text-sm font-medium">Buttons</span>
          <span class="text-xs text-gray-400">
            {{ buttons.length }}/{{ MAX_BUTTONS }}
          </span>
        </div>

        <div
            v-for="(btn, index) in buttons"
            :key="index"
            class="border rounded-md p-3 mb-3 bg-red-50 relative"
          >
            <!-- HANDLE FOR EACH BUTTON -->
            <Handle
              type="source"
              :id="getButtonHandleId(index)"
              :position="Position.Right"
              class="!h-3 !w-3 !border-2 !border-white bg-red-500 absolute -right-2 top-6"
            />

            <div class="flex justify-between items-center mb-2">
              <span class="text-sm font-medium">Button {{ index + 1 }}</span>
              <button
                @click="removeButton(index)"
                class="text-red-500 text-xs"
              >
                ✕
              </button>
            </div>

            <label class="text-xs font-medium">
              Button Text *
            </label>
            <input
              type="text"
              :value="btn.text"
              @input="e => updateButton(index, 'text', e.target.value)"
              class="w-full border rounded-md p-2 text-sm mb-2"
              placeholder="Button text (max 20 chars)"
            />

            <label class="text-xs font-medium">
              Value *
            </label>
            <input
              type="text"
              :value="btn.value"
              @input="e => updateButton(index, 'value', e.target.value)"
              class="w-full border rounded-md p-2 text-sm"
              placeholder="Payload value"
            />

            <div class="text-xs mt-2 flex justify-between">
              <span>
                Button {{ index + 1 }} response
              </span>
              <span
                :class="btn.connected ? 'text-green-600' : 'text-red-500'"
              >
                {{ btn.connected ? 'Connected' : 'Not connected' }}
              </span>
            </div>
          </div>

        <button
          @click="addButton"
          :disabled="buttons.length >= MAX_BUTTONS"
          class="w-full py-2 text-sm rounded-md bg-blue-50 text-blue-600"
        >
          + Add Button
        </button>
      </div>

      </div>
    </div>

    <Handle
      type="target"
      id = "input"
      :position="Position.Left"
      class="!h-4 !w-4 !border-2 !border-white bg-gradient-to-r from-red-500 to-orange-500"
    />
    <!-- <Handle
      type="source"
      id = "output"
      :position="Position.Right"
      class="!h-4 !w-4 !border-2 !border-white bg-gradient-to-r from-red-500 to-orange-500"
    /> -->
  </div>
</template>
