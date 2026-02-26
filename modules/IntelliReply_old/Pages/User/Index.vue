<template>
    <SettingLayout :aimodule="aimodule" :fbmodule="fbmodule">
        <div class="md:h-[90vh]">
            <div class="flex justify-center items-center">
                <div class="md:w-[60em]">

                    <!-- 1. Enable AI -->
                    <EnableAIAssistant
                        :enabled="parseJson?.ai?.active"
                        @update="updateAIStatus"
                    />

                    <!-- 2. AI Setup -->
                    <AIAssistantSetup
                        :settings="parseJson"
                        @save="saveAISetup"
                    />

                    <!-- 3. Knowledge Base -->
                    <KnowledgeBase
                        :rows="rows"
                        :filters="filters"
                        @upload="openUploadModal"
                    />

                    <UploadKnowledgeModal
                        :show="showUpload"
                        @close="showUpload=false"
                        @upload="uploadDocument"
                    />

                </div>
            </div>
        </div>
    </SettingLayout>
</template>

<script setup>

import { ref } from 'vue'
import { router } from '@inertiajs/vue3'

import SettingLayout from "./../../../../resources/js/Pages/User/CannedResponse/Layout.vue";
import EnableAIAssistant from './Components/EnableAIAssistant.vue'
import AIAssistantSetup from './Components/AIAssistantSetup.vue'
import KnowledgeBase from './Components/KnowledgeBase.vue'
import UploadKnowledgeModal from './Components/UploadKnowledgeModal.vue'

const props = defineProps([
    'rows', 'filters',
    'organization',
    'aimodule',
    'fbmodule'
])

const showUpload = ref(false)


const parseJson = () => {
    return JSON.parse(props.organization?.metadata);
}

function updateAIStatus(value)
{
    router.post('automation/ai/toggle', {
        enabled: value
    })
}

function saveAISetup(data)
{
    router.post(route('ai.settings.save'), data)
}

function openUploadModal()
{
    showUpload.value = true
}

function uploadDocument(file)
{
    const formData = new FormData()
    formData.append('file', file)

    router.post(route('ai.knowledge.upload'), formData)
}

</script>
