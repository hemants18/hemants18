<script setup>
import { QuillEditor } from '@vueup/vue-quill'
import '@vueup/vue-quill/dist/vue-quill.snow.css'

const props = defineProps({
    modelValue: {
        type: String,
        default: ''
    },
    showLabel: {
        type: Boolean,
        default: true
    },
    name: String,
    className: String,
    placeholder: String,
    error: String,
})

const emit = defineEmits(['update:modelValue'])

const updateValue = (value) => {
    emit('update:modelValue', value)
}
</script>

<template>
    <div :class="className">
        <!-- Label -->
        <label v-if="showLabel" class="block text-sm leading-6 text-gray-900">
            {{ name }}
        </label>

        <!-- Editor -->
        <div class="mt-2">
            <QuillEditor
                :content="modelValue"
                contentType="html"
                toolbar="essential"
                theme="snow"
                :placeholder="placeholder"
                @update:content="updateValue"
                style="height:300px"
                class="bg-white"
            />
        </div>

        <!-- Error -->
        <div v-if="error" class="text-[#b91c1c] text-xs mt-1">
            {{ error }}
        </div>
    </div>
</template>
