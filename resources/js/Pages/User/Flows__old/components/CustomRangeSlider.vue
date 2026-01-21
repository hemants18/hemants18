<script setup>
import { ref, watch } from 'vue'
import Slider from '@vueform/slider'
import '@vueform/slider/themes/default.css'

const props = defineProps({
  modelValue: {
    type: Number,
    default: 50,
  },
  min: {
    type: Number,
    default: 0,
  },
  max: {
    type: Number,
    default: 100,
  },
  step: {
    type: Number,
    default: 1,
  },
})

const emit = defineEmits(['update:modelValue'])

const value = ref(props.modelValue)

watch(value, (v) => emit('update:modelValue', v))
watch(() => props.modelValue, (v) => (value.value = v))
</script>

<template>
  <div class="slider">
    <Slider
      v-model="value"
      :min="min"
      :max="max"
      :step="step"
      class="custom-slider"
    >
      <!-- CUSTOM KNOB -->
      <template #handle="{ value }">
        <div class="knobby">
          <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20">
            <path
              fill="#006F8A"
              fill-rule="evenodd"
              d="M9.864 20c5.243-5.195 7.864-9.24 7.864-12.136A7.863 7.863 0 009.864 0 7.863 7.863 0 002 7.864C2 10.759 4.621 14.804 9.864 20z"
            />
            <text
              x="10"
              y="10"
              fill="#fff"
              text-anchor="middle"
            >
              {{ value }}%
            </text>
          </svg>
        </div>
      </template>
    </Slider>
  </div>
</template>

<style scoped>
.slider {
  width: 300px;
  margin-top: 90px;
}

/* Track */
.custom-slider .slider-track {
  height: 11px;
  background-color: #c4e4eb;
  border-radius: 5px;
}

/* Fill */
.custom-slider .slider-connect {
  background-color: #006f8a;
}

/* Knob base (hidden, we replace it) */
.custom-slider .slider-handle {
  background: transparent;
  border: none;
  box-shadow: none;
}

/* Custom knob */
.knobby {
  position: relative;
}

.knobby svg {
  width: 50px;
  height: 50px;
  position: absolute;
  top: -65px;
  left: -14px;
}

.knobby text {
  font-size: 5px;
  font-weight: bold;
}
</style>
