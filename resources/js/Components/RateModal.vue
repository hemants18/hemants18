<script setup> 
    import { defineProps, defineEmits } from 'vue' 
    import Modal from '@/Components/Modal.vue' 
    import { toast } from 'vue3-toastify' 

    const props = defineProps({ 
            modelValue: Boolean, 
            label: { type: String, default: 'WhatsApp Conversation Rate Card' }, 
            data: { type: Object, required: true} 
        }) 
    const emit = defineEmits(['update:modelValue']) 
    const onClose = () => { emit('update:modelValue', false) } 


    const getValueByKey = (key) => {
        const found = props.data.find(item => item.key === key);
        return found ? found.value : '';
    };
</script>

<template>
  <Modal :label="label" :isOpen="modelValue">
    <div v-if="getValueByKey('marketing')" class="mt-5 w-full max-w-md mx-auto">

     <!--  <h3 class="text-sm font-semibold text-slate-700 mb-3">
        WhatsApp Conversation Rate Card
      </h3> -->

      <div class="space-y-2">
        <div class="flex items-center justify-between rounded-lg border px-4 py-2 text-sm">
          <span class="capitalize text-slate-600">
            {{ $t('Marketing') }}
          </span>

          <span class="font-medium text-slate-800">
            {{ getValueByKey('marketing') }}
          </span>
        </div>


        <div class="flex items-center justify-between rounded-lg border px-4 py-2 text-sm" >
          <span class="capitalize text-slate-600">
            {{ $t('Utility') }}
          </span>

          <span class="font-medium text-slate-800">
            {{ getValueByKey('utility') }}
          </span>
        </div>

        <div class="flex items-center justify-between rounded-lg border px-4 py-2 text-sm">
          <span class="capitalize text-slate-600">
           {{ $t('Authentication') }}
          </span>

          <span class="font-medium text-slate-800">
            {{ getValueByKey('authentication') }}
          </span>
        </div>

        <div class="flex items-center justify-between rounded-lg border px-4 py-2 text-sm">
          <span class="capitalize text-slate-600">
            {{ $t('Service') }}
          </span>

          <span class="font-medium text-slate-800">
            {{ getValueByKey('service') }}
          </span>
        </div>

      </div>

      <p class="mt-3 text-xs text-slate-500">
        * Charged per 24-hour conversation window as per Meta pricing.
      </p>

      <div class="mt-4 flex justify-end">
        <button
          @click="onClose"
          class="rounded-md bg-slate-100 px-4 py-2 text-sm text-slate-600 hover:bg-slate-200"
        >
          Close
        </button>
      </div>

    </div>

    <div v-else class="text-sm text-slate-500 text-center mt-6">
      Rate card not available

      <div class="mt-4 flex justify-end">
        <button
          @click="onClose"
          class="rounded-md bg-slate-100 px-4 py-2 text-sm text-slate-600 hover:bg-slate-200"
        >
          Close
        </button>
      </div>

    </div>
  </Modal>
</template>
