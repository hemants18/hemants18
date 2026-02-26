<template>

<Modal :show="show">

    <div class="p-4">

        <h3>Upload Document</h3>

        <input
            type="file"
            @change="selectFile"
        />

        <button
            @click="upload"
            class="bg-primary text-white px-3 h-8 rounded"
        >
            Upload
        </button>

    </div>

</Modal>

</template>

<script setup>

import { ref } from 'vue'
import Modal from '@/Components/Modal.vue'

const props = defineProps({
    show: Boolean
})

const emit = defineEmits(['close', 'upload'])

const file = ref(null)

function selectFile(e)
{
    file.value = e.target.files[0]
}

function upload()
{
    emit('upload', file.value)
}

</script>
