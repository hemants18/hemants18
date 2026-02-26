<template>
    <SettingLayout :aimodule="aimodule" :fbmodule="fbmodule">
        <div class="md:h-[90vh]">
            <div class="flex justify-center items-center">
                <div class="md:w-[60em]">

                    <!-- 1. Enable AI -->
                    <div class="bg-white border border-slate-200 rounded-lg pt-2 text-sm mb-4 px-4 mb-20">
                        <div class="w-full py-2 mb-4 mt-2">

                            <div class="flex w-full">
                                <div class="text-md">
                                    <h4 class="text-[16px]">{{$t('Enable Opt-In')}}</h4>
                                    <div class="mb-1 text-slate-500">{{$t('Activate Opt-In in your conversations')}}</div>
                                </div>

                                <div class="ml-auto">
                                    <div class="flex items-center gap-x-3">
                                        <!-- <FormToggleSwitch v-model="localEnabled" /> -->
                                        <div class="w-12 h-6 flex items-center bg-gray-300 rounded-full p-1" :class="{ 'bg-primary': props.rows.enabled}" @click="updateAIStatus(enabled)">
                                            <div class="bg-white w-4 h-4 rounded-full shadow-md transform duration-300 ease-in-out" :class="{ 'translate-x-6': props.enabled}"></div>
                                        </div>
                                        
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- <AIAssistantSetup
                        :settings="parseJson"
                        @save="saveAISetup"
                    />

                    <KnowledgeBase
                        :rows="rows"
                        :filters="filters"
                        @upload="openUploadModal"
                    />

                    <UploadKnowledgeModal
                        :show="showUpload"
                        @close="showUpload=false"
                        @upload="uploadDocument"
                    /> -->

                </div>
            </div>
        </div>
    </SettingLayout>
</template>

<script setup>

import { ref } from 'vue'
import { router } from '@inertiajs/vue3'

import SettingLayout from "./Layout.vue";

const props = defineProps([
    'rows', 'filters',
    'organization',
])

const showUpload = ref(false)


const parseJson = () => {
    return JSON.parse(props.organization?.metadata);
}

function updateAIStatus(value)
{
    console.log('sss'+value);
    // router.post('automation/ai/toggle', {
    //     enabled: value
    // })
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
