<script setup>
const props = defineProps({

    modelValue: {
        type: [Boolean, Number],
        default: false
    },

    name: String,

    label: String,

    className: String,

    disabled: {
        type: Boolean,
        default: false
    },

    error: String,

    showLabel: {
        type: Boolean,
        default: true
    }

})

const emit = defineEmits(['update:modelValue'])

const updateValue = () => {

    if (!props.disabled) {

        emit('update:modelValue', props.modelValue ? 0 : 1)

    }

}
</script>

<template>

    <div :class="className">

        <!-- Label -->
        <label v-if="showLabel" class="block text-sm text-gray-900 mb-1">
            {{ label }}
        </label>

        <!-- Toggle -->
        <div
            class="w-12 h-6 flex items-center bg-gray-300 rounded-full p-1 cursor-pointer transition"
            :class="{
                'bg-primary': modelValue == true || modelValue == 1,
                'opacity-50 cursor-not-allowed': disabled
            }"
            @click="updateValue"
        >

            <div
                class="bg-white w-4 h-4 rounded-full shadow-md transform duration-300 ease-in-out"
                :class="{
                    'translate-x-6': modelValue == true || modelValue == 1
                }"
            ></div>

        </div>

        <!-- Error -->
        <div v-if="error" class="text-red-600 text-xs mt-1">
            {{ error }}
        </div>

    </div>

</template>
