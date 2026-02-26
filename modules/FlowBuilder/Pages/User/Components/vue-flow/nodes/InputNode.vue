<script setup lang="ts">
import { ref, watch } from 'vue'
import { Handle, Position, useVueFlow, useNode } from '@vue-flow/core'
import { MoreHorizontalIcon } from 'lucide-vue-next'

import {
  Menubar,
  MenubarMenu,
  MenubarTrigger,
  MenubarContent,
  MenubarItem
} from './../../ui/menubar'

import FormInput from '@/Components/FormInput.vue'
import FormSelect from '@/Components/FormSelect.vue';
import type { NodeProps } from '@vue-flow/core'

const options = ref([
  // { value: 'none', label: 'None' },
  { value: 'text', label: 'Text' },
  { value: 'phone', label: 'Phone' },
  { value: 'email', label: 'Email' },
  { value: 'date', label: 'Date' },
  { value: 'time', label: 'Time' },
  { value: 'textarea', label: 'Textarea' },
  { value: 'url', label: 'URL' },
]);


const props = defineProps<NodeProps>()

const node = useNode()
const { removeNodes, nodes, addNodes } = useVueFlow()

const title = ref(props.data.title || 'Input Form')
const isEditTitle = ref(false)

const formTitle = ref(
  props.data.metadata?.fields?.title || ''
)

const confirmationMessage = ref(
  props.data.metadata?.fields?.confirmation_message || ''
)

const fields = ref(
  props.data.metadata?.fields?.fields || []
)

watch(
  [formTitle, confirmationMessage, fields],
  () => {
    node.node.data.metadata.fields = {
      type: 'input',
      form_id: props.id,
      title: formTitle.value,
      fields: fields.value,
      confirmation_message: confirmationMessage.value
    }
  },
  { deep: true }
)

function addField() {
  fields.value.push({
    key: '',
    question: '',
    input_type: 'text',
    required: false
  })
}

function deleteField(index) {
  fields.value.splice(index, 1)
}

function handleClickDeleteBtn() {
  removeNodes(node.id)
}

function handleClickDuplicateBtn() {

  const newNode = {
    id: (nodes.value.length + 1).toString(),
    type: node.node.type,
    position: {
      x: node.node.position.x + 100,
      y: node.node.position.y + 100
    },
    data: JSON.parse(JSON.stringify(node.node.data))
  }

  addNodes(newNode)
}


// console.log(fields.value.length);

const handleConnectable = (node, connectedEdges) => {
  return connectedEdges.length <= 1
}
</script>

<template>

  <div class="rounded-sm border border-gray-200 bg-white p-3 shadow-md">
    <Handle type="target" :position="Position.Left" :connectable="handleConnectable"/>
      <div class="flex flex-col gap-y-2">
        <div class="flex justify-between items-center">

          <div class="flex gap-x-2">
            <img src="~@/assets/images/icon_LLM.png" class="mt-1 h-4 w-4" alt="LLM icon" />
            <div class="flex flex-col gap-y-1">
              <FormInput v-if="isEditTitle" v-model="title" :name="''" :type="'text'" :class="'col-span-4'" @blur="() => (isEditTitle = false)"/>
              <h3 class="text-base capitalize" v-else>{{ title }}</h3>
            </div>
          </div>

          <Menubar class="border-none">
            <menubar-menu>
              <menubar-trigger>
                <more-horizontal-icon />
              </menubar-trigger>
              <menubar-content>
                <menubar-item @click="handleClickDuplicateBtn"> Duplicated </menubar-item>
                <menubar-item @click="handleClickDeleteBtn"> Delete </menubar-item>
                <menubar-item @click="isEditTitle = true"> Rename </menubar-item>
              </menubar-content>
            </menubar-menu>
          </Menubar>
        </div>

        <div v-if="(formTitle == null || formTitle == '') || (confirmationMessage == null || confirmationMessage == '') " class="flex items-center gap-x-2 bg-red-500 text-white rounded-md px-2 py-2">
        <span>
          <svg xmlns="http://www.w3.org/2000/svg" width="1em" height="1em" viewBox="0 0 24 24"><g fill="none"><path d="m12.593 23.258l-.011.002l-.071.035l-.02.004l-.014-.004l-.071-.035q-.016-.005-.024.005l-.004.01l-.017.428l.005.02l.01.013l.104.074l.015.004l.012-.004l.104-.074l.012-.016l.004-.017l-.017-.427q-.004-.016-.017-.018m.265-.113l-.013.002l-.185.093l-.01.01l-.003.011l.018.43l.005.012l.008.007l.201.093q.019.005.029-.008l.004-.014l-.034-.614q-.005-.018-.02-.022m-.715.002a.02.02 0 0 0-.027.006l-.006.014l-.034.614q.001.018.017.024l.015-.002l.201-.093l.01-.008l.004-.011l.017-.43l-.003-.012l-.01-.01z"/><path fill="currentColor" d="m13.299 3.148l8.634 14.954a1.5 1.5 0 0 1-1.299 2.25H3.366a1.5 1.5 0 0 1-1.299-2.25l8.634-14.954c.577-1 2.02-1 2.598 0M12 15a1 1 0 1 0 0 2a1 1 0 0 0 0-2m0-7a1 1 0 0 0-.993.883L11 9v4a1 1 0 0 0 1.993.117L13 13V9a1 1 0 0 0-1-1"/></g></svg>
        </span>
        <span class="text-sm">Please fill all the required fields</span>
      </div>

        <span class="text-sm text-gray-500" >Send input message to your recipients.</span>

        <div class="mb-4">
            <label class="text-sm mb-2">Form Title <span class="text-red-500">*</span></label>
            <FormInput v-model="formTitle" :name="''" :type="'text'" :optionClassName="'h-32'"  :class="'col-span-4'"/>
        </div>


        <div class="mt-4">
          <button class="bg-slate-100 p-1 rounded-md text-sm px-2" @click="addField" > Add Field ( min 1 ) <span class="text-red-500">*</span></button>
          <div v-for="(field, index) in fields" :key="index" class="border p-2 mb-2">

            <div class="mb-4">
              <label class="text-sm mb-2">Field Key</label>
              <FormInput v-model="field.key" :name="''" :type="'text'" :optionClassName="'h-32'"  :class="'col-span-4'"
              />
            </div>

            <div class="mb-4">
                <label class="text-sm mb-2">Question</label>
                <FormInput v-model="field.question" :name="''" :type="'text'" :optionClassName="'h-32'"  :class="'col-span-4'"
              />
            </div>

            <div class="mb-4">
                <FormSelect v-model="field.input_type" :name="''" :type="'text'" :optionClassName="'h-32'"  :options="options" :class="'col-span-4'"/>
            </div>
            <div class="mb-4">
              <label><input type="checkbox" v-model="field.required"/> Required</label>
            </div>

            <button @click="deleteField(index)"> <span class="text-red-500 text-sm">Delete row</span></button>
        </div>
    </div>
    <div class="mb-4">
      <label class="text-sm mb-2">Confirmation Message <span class="text-red-500">*</span></label>
    </div>
    <FormInput v-model="confirmationMessage" />
    </div>
  </div>
<Handle type="source" :position="Position.Right" :connectable="handleConnectable"/>

</template>
