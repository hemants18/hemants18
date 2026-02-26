<script setup>
import Multiselect from 'vue-multiselect'
import 'vue-multiselect/dist/vue-multiselect.css'

const props = defineProps({
    modelValue: {
        type: [Array, Object, String, Number, null],
        default: null
    },
    options: {
        type: Array,
        default: () => []
    },
    showLabel: {
        type: Boolean,
        default: true
    },
    name: String,
    placeholder: {
        type: String,
        default: 'Select option'
    },
    label: {
        type: String,
        default: 'name'
    },
    trackBy: {
        type: String,
        default: 'id'
    },
    multiple: {
        type: Boolean,
        default: true
    },
    error: String,
    className: String,
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

        <!-- Multiselect -->
        <div class="mt-2">
            <Multiselect
                :modelValue="modelValue"
                @update:modelValue="updateValue"
                :options="options"
                :multiple="multiple"
                :label="label"
                :track-by="trackBy"
                :placeholder="placeholder"
                class="bg-white"
            />
        </div>

        <!-- Error -->
        <div v-if="error" class="text-red-600 text-xs mt-1">
            {{ error }}
        </div>

    </div>
</template>
