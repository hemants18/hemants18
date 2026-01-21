<script setup>
import { Handle, Position } from '@vue-flow/core'
import { computed, ref } from 'vue'
import axios from "axios";

const props = defineProps({
  id: String,
  data: { type: Object, required: true }
})

/* ---------- MEDIA URL ---------- */
const mediaUrl = computed({
  get: () => props.data.mediaUrl || '',
  set: (val) => {
    props.data.updateNodeData(props.id, { mediaUrl: val })
  }
})

/* ---------- MEDIA TYPE ---------- */
const mediaType = computed({
  get: () => props.data.mediaType || 'image',
  set: (val) => {
    props.data.updateNodeData(props.id, { mediaType: val })
  }
})

/* ---------- CAPTION ---------- */
const caption = computed({
  get: () => props.data.caption || '',
  set: (val) => {
    props.data.updateNodeData(props.id, { caption: val })
  }
})

const mediaPreview = ref(props.data.mediaUrl || '')
const uploadProgress = ref(0)
const uploading = ref(false)
const error = ref('')

const MAX_SIZE = 2 * 1024 * 1024 // 16MB

const allowedTypes = {
  image: ['image/jpeg', 'image/png', 'image/webp'],
  video: ['video/mp4', 'video/quicktime'],
  audio: ['audio/mpeg', 'audio/wav'],
  document: ['application/pdf', 'application/msword']
}

const handleFile = async (file) => {
  error.value = ''

  if (file.size > MAX_SIZE) {
    error.value = 'File must be less than 2MB'
    return
  }

  if (!allowedTypes[mediaType.value].includes(file.type)) {
    error.value = `Invalid file type for ${mediaType.value}`
    return
  }

  mediaPreview.value = URL.createObjectURL(file)

  const formData = new FormData()
  formData.append('file', file)
  formData.append('type', mediaType.value)

  uploading.value = true

   const res = await axios.post("/automation/flows/upload-files", formData, {
    headers: { "Content-Type": "multipart/form-data" },
    onUploadProgress: (e) => {
      uploadProgress.value = Math.round((e.loaded / e.total) * 100);
    }
  });

  const uploadedUrl = res.data.file_object.file;

  mediaPreview.value = uploadedUrl;
  
  props.data.updateNodeData(props.id, {
    mediaUrl: uploadedUrl,
    mediaType: mediaType.value
  });

  uploading.value = false;
}

const onFileChange = (e) => {
  const file = e.target.files[0]
  if (file) handleFile(file)
}

const onDrop = (e) => {
  e.preventDefault()
  const file = e.dataTransfer.files[0]
  if (file) handleFile(file)
}

/* ---------- ACTIONS ---------- */

const collapsed = ref(false)
const toggleCollapse = () => (collapsed.value = !collapsed.value)
const copyNode = () => props.data.copyNode({ id: props.id })
const deleteNode = () => props.data.deleteNode(props.id)
</script>

<template>
  <div
    class="flow-node relative rounded-xl border-2 bg-white shadow-lg overflow-hidden"
    style="min-width: 320px; max-width: 400px;"
  >

    <div class="h-1.5 bg-gradient-to-r from-blue-500 to-cyan-500"></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">

        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-blue-100 text-blue-600">
            <i class="las la-photo-video"></i>
          </div>
          <div class="text-sm font-medium">Media Message</div>
        </div>

        <div class="flex space-x-1">
          <button @click="toggleCollapse" class="border p-1.5 rounded-md">
            <i :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"></i>
          </button>

          <button @click="copyNode" class="border p-1.5 rounded-md">
            <i class="las la-copy"></i>
          </button>

          <button
            @click="deleteNode"
            class="rounded-md border p-1.5 text-red-600 hover:bg-red-50"
          >
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <div v-show="!collapsed">

        <!-- MEDIA TYPE DROPDOWN -->
        <label class="text-xs font-medium">Media Type *</label>
        <select
          v-model="mediaType"
          class="w-full border rounded-md p-2 text-sm mb-3"
        >
          <option value="image">Image</option>
          <option value="video">Video</option>
          <option value="audio">Audio</option>
          <option value="document">Document</option>
        </select>

        <!-- UPLOAD INPUT -->
        <div
          class="border-2 border-dashed rounded-lg p-6 mb-3 text-center transition-all"
          :class="isDragging ? 'bg-blue-100 border-blue-500' : 'bg-blue-50'"
          @dragover="onDragOver"
          @dragleave="onDragLeave"
          @drop="onDrop"
        >

          <input
            type="file"
            :accept="
              mediaType === 'image' ? 'image/*' :
              mediaType === 'video' ? 'video/*' :
              mediaType === 'audio' ? 'audio/*' :
              '*/*'
            "
            @change="onFileChange"
            class="hidden"
            id="media-upload"
          />

          <label for="media-upload" class="cursor-pointer text-blue-600 text-sm">
            📁 Drag & Drop {{ mediaType }} here  
            <br />
            <span class="text-xs text-gray-500">or click to upload</span>
          </label>
        </div>

        <!-- Error -->
        <div v-if="error" class="text-red-600 text-xs mb-2">
          {{ error }}
        </div>

        <!-- Progress Bar -->
        <div v-if="uploading" class="w-full bg-gray-200 h-2 rounded mb-3">
          <div
            class="bg-blue-500 h-2 rounded"
            :style="{ width: uploadProgress + '%' }"
          ></div>
        </div>

        <!-- OR PASTE MEDIA URL -->
        <label class="text-xs font-medium">Or Paste Media URL</label>
        <input
          type="text"
          v-model="mediaUrl"
          placeholder="https://example.com/file.jpg"
          class="w-full border rounded-md p-2 text-sm mb-3"
        />

        <!-- PREVIEW -->
        <div v-if="mediaUrl" class="mb-3">

          <img
            v-if="mediaType === 'image'"
            :src="mediaUrl"
            class="w-full rounded-md"
          />

          <video
            v-else-if="mediaType === 'video'"
            :src="mediaUrl"
            controls
            class="w-full rounded-md"
          />

          <audio
            v-else-if="mediaType === 'audio'"
            :src="mediaUrl"
            controls
            class="w-full"
          />

          <div
            v-else
            class="border rounded-md p-3 text-sm bg-gray-50"
          >
            📄 Document URL:
            <br />
            <a :href="mediaUrl" target="_blank" class="text-blue-600 underline">
              Open Document
            </a>
          </div>
        </div>

        <!-- CAPTION -->
        <label class="text-xs font-medium">Caption (optional)</label>
        <textarea
          v-model="caption"
          rows="2"
          class="w-full border rounded-md p-2 text-sm mt-1"
          placeholder="Add a caption..."
        />
      </div>
    </div>

    <!-- INPUT handle -->
    <Handle
      type="target"
      id="input"
      :position="Position.Left"
      class="!h-4 !w-4 !border-2 !border-white bg-gradient-to-r from-blue-500 to-cyan-500"
    />

    <!-- OUTPUT handle -->
    <Handle
      type="source"
      id="output"
      :position="Position.Right"
      class="!h-4 !w-4 !border-2 !border-white bg-gradient-to-r from-blue-500 to-cyan-500"
    />
  </div>
</template>
