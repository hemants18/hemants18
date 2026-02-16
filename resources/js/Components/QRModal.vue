<script setup>
import { defineProps, defineEmits } from 'vue'
import Modal from '@/Components/Modal.vue'
import { toast } from 'vue3-toastify'

const props = defineProps({
    modelValue: Boolean,
    label: {
        type: String,
        default: 'Connect WhatsApp'
    },
    data: {
        type: Object,
        required: true,
        // expected shape:
        // {
        //   code: '',
        //   qr_image_url: '',
        //   deep_link_url: '',
        //   prefilled_message: ''
        // }
    }
})

const copyLink = async () => {
    try {
        await navigator.clipboard.writeText(props.data.deep_link_url)
        toast('Link copied!', { autoClose: 2000 })
    } catch (err) {
        toast('Failed to copy '+ err, { autoClose: 2000 })
    }
}

const emit = defineEmits(['update:modelValue'])

const onClose = () => {
    emit('update:modelValue', false)
}
</script>
<template>
    <Modal :label="label" :isOpen="modelValue">
        <div v-if="data" class="mt-5 flex flex-col items-center gap-4 text-center">

            <!-- QR Image -->
            <div v-if="data.qr_image_url" class="border rounded-lg p-3">
                <img
                    :src="data.qr_image_url"
                    alt="WhatsApp QR Code"
                    class="w-56 h-56 object-contain"
                />
            </div>

            <!-- Code -->
            <div v-if="data.code" class="text-sm text-slate-600">
                <span class="font-medium">Code:</span>
                <span class="ml-1 font-mono bg-slate-100 px-2 py-1 rounded">
                    {{ data.code }}
                </span>
            </div>

            <!-- Deep Link -->
            <a
                v-if="data.deep_link_url"
                :href="data.deep_link_url"
                target="_blank"
                class="text-primary underline text-sm"
            >
                Open in WhatsApp
            </a>

            <button
                type="button"
                @click="copyLink"
                class="text-xs px-2 py-1 rounded bg-slate-100 hover:bg-slate-200 text-slate-600"
            >
                Copy link ({{data.deep_link_url}})
            </button>

            <!-- Prefilled Message -->
            <div v-if="data.prefilled_message" class="text-xs text-slate-500">
                Prefilled message: “{{ data.prefilled_message }}”
            </div>

            <!-- Actions -->
            <div class="mt-4 flex gap-3">
                <button
                    @click="onClose"
                    class="inline-flex justify-center rounded-md bg-slate-100 px-4 py-2 text-sm text-slate-600 hover:bg-slate-200"
                >
                    Close
                </button>
            </div>

        </div>
        <div v-else class="text-sm text-slate-500 text-center">
            QR code not available

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
