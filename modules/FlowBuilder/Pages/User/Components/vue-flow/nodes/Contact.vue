<script setup lang="ts">
import { ref, watch, computed } from 'vue'
import { MoreHorizontalIcon } from 'lucide-vue-next'
import { Handle, Position, useVueFlow, useNode } from '@vue-flow/core'
import { Menubar, MenubarMenu, MenubarTrigger, MenubarContent, MenubarItem } from './../../ui/menubar'

import FormInput from '@/Components/FormInput.vue'
import FormSelect from '@/Components/FormSelect.vue'
import FormTextArea from '@/Components/FormTextArea.vue'

import type { NodeProps } from '@vue-flow/core'

const props = defineProps<NodeProps>()

const title = ref(props.data.title)
const uuid = ref(props.data.uuid)
const isEditTitle = ref(false)

const fields = ref({
  service_id: props.data.metadata?.customer?.service_id || '',
  collect_name: props.data.metadata?.customer?.collect_name ?? true,
  collect_email: props.data.metadata?.customer?.collect_email ?? true,
  collect_phone: props.data.metadata?.customer?.collect_phone ?? true,
  require_payment: props.data.metadata?.customer?.require_payment ?? false,
  confirmation_message: props.data.metadata?.customer?.confirmation_message || '',
})

const node = useNode()
const { removeNodes, nodes, addNodes } = useVueFlow()

watch(
  fields,
  (newFields) => {
    node.node.data.metadata.customer = { ...newFields }
  },
  { deep: true }
)

function handleClickDeleteBtn() {
  removeNodes(node.id)
}

function handleClickDuplicateBtn() {
  const { type, position, label, data } = node.node

  const newNode = {
    id: (nodes.value.length + 1).toString(),
    type,
    position: {
      x: position.x + 100,
      y: position.y + 100
    },
    label,
    data
  }

  addNodes(newNode)
}

const shouldShowWarning = computed(() => {
  return (
    fields.value.service_id === '' ||
    fields.value.confirmation_message === ''
  )
})
</script>
<template>
  <div class="rounded-sm border border-gray-200 bg-white p-3 shadow-md">
    <Handle type="target" :position="Position.Left" />

    <div class="flex flex-col gap-y-2">

      <!-- Header -->
      <div class="flex justify-between items-center">
        <div class="flex gap-x-2">
          <img src="~@/assets/images/icon_booking.png" class="mt-1 h-4 w-4" />
          <div>
            <FormInput
              v-if="isEditTitle"
              v-model="title"
              :name="''"
              :type="'text'"
              @blur="() => (isEditTitle = false)"
            />
            <h3 v-else class="text-base">{{ title }}</h3>
          </div>
        </div>

        <Menubar class="border-none">
          <menubar-menu>
            <menubar-trigger>
              <more-horizontal-icon />
            </menubar-trigger>
            <menubar-content>
              <menubar-item @click="handleClickDuplicateBtn"> Duplicate </menubar-item>
              <menubar-item @click="handleClickDeleteBtn"> Delete </menubar-item>
              <menubar-item @click="isEditTitle = true"> Rename </menubar-item>
            </menubar-content>
          </menubar-menu>
        </Menubar>
      </div>

      <!-- Warning -->
      <div v-if="shouldShowWarning"
           class="flex items-center gap-x-2 bg-red-500 text-white rounded-md px-2 py-2">
        <span class="text-sm">Please configure required fields</span>
      </div>

      <span class="text-sm text-gray-500">
        Configure booking form settings.
      </span>

      <!-- Service Selection -->
      <div class="mb-4">
        <label class="text-sm mb-2">
          <span class="text-red-500">*</span> Select Service
        </label>

        <FormSelect
          v-model="fields.service_id"
          :options="[
            { value: 1, label: 'Consultation' },
            { value: 2, label: 'Demo Call' }
          ]"
        />
      </div>

      <!-- Collect Fields -->
      <div class="mb-4">
        <label class="text-sm mb-2">Collect Fields</label>

        <div class="flex flex-col gap-y-2 text-sm">
          <label>
            <input type="checkbox" v-model="fields.collect_name" />
            Collect Name
          </label>

          <label>
            <input type="checkbox" v-model="fields.collect_email" />
            Collect Email
          </label>

          <label>
            <input type="checkbox" v-model="fields.collect_phone" />
            Collect Phone
          </label>
        </div>
      </div>

      <!-- Require Payment -->
      <div class="mb-4">
        <label class="text-sm">
          <input type="checkbox" v-model="fields.require_payment" />
          Require Payment Before Confirmation
        </label>
      </div>

      <!-- Confirmation Message -->
      <div class="mb-4">
        <label class="text-sm mb-2">
          <span class="text-red-500">*</span> Confirmation Message
        </label>

        <FormTextArea
          v-model="fields.confirmation_message"
          :placeholder="'Booking confirmed! See you soon.'"
        />
      </div>

    </div>

    <Handle type="source" :position="Position.Right" />
  </div>
</template>

