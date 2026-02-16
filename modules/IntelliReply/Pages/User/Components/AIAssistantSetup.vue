<template>

<form @submit.prevent="save"
class="bg-white border border-slate-200 rounded-lg py-2 text-sm mb-4 pb-4">

    <div class="flex items-center justify-between px-4 pt-2 pb-4">
        <div class="w-[90%] cursor-pointer">
            <h4 class="text-[16px]">AI Assistant Setup</h4>
            <div class="text-slate-500">Setup keywords for AI assistance</div>
        </div>
        <div class="w-[10%]">
            <button type="button" class="hover:bg-slate-50 rounded-full p-1 float-right">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="black" fill-rule="evenodd" d="M16.53 14.03a.75.75 0 0 1-1.06 0L12 10.56l-3.47 3.47a.75.75 0 0 1-1.06-1.06l4-4a.75.75 0 0 1 1.06 0l4 4a.75.75 0 0 1 0 1.06" clip-rule="evenodd"></path></svg></button>
        </div>
    </div>

    <div>
        <div class="flex space-x-10 border-b w-full px-4 py-6">
            <div class="w-[70%]">
                <span class="text-slate-600">{{$t('Enable automatic AI assistance for new conversations')}}</span>
                <div class="text-xs text-slate-700 flex items-center">
                    <span>{{$t('Turn on this option to let users automatically get help from the AI whenever they start a new conversation or ticket. If enabled, this will override the keywords set for initiating AI chat.')}}</span>
                </div>
            </div>
            <div class="w-[30%]">
                <div class="ml-auto w-12 h-6 flex items-center rounded-full p-1">
                    <FormToggleSwitch v-model="form.ai_chat_form_active"/>
                </div>
            </div>
        </div>
        <div class="flex space-x-10 border-b w-full px-4 py-6">
            <div class="w-[40%]">
                <span class="text-slate-600">{{$t('Keyword(s) to start the AI agent')}}</span>
                <div class="text-xs text-slate-700 flex items-center">
                    <span>{{$t('Set word or phrase')}}</span>
                </div>
            </div>


            <div class="w-[60%]">
                <div class="col-span-4">
                    <FormInput :name="$t('Start Keyword')" :error="form.errors.start_keywords" :type="'text'" :class="'col-span-3'" v-model="form.start_keywords" />
                </div>

            </div>
        </div>
        <div class="flex space-x-10 border-b w-full px-4 py-6">
            <div class="w-[40%]">
                <span class="text-slate-600">Keyword(s) to stop the AI agent</span>
                <div class="text-xs text-slate-700 flex items-center">
                    <span>Set word or phrase</span>
                </div>
            </div>
            <div class="w-[60%]">
                <div class="col-span-4">
                    <FormTextArea :name="$t('Stop Keyword')" :error="form.errors.stop_keywords" v-model="form.stop_keywords" :class="'col-span-3'" />
                </div>
            </div>
        </div>

        <div class="flex px-4 pt-1">
            <div class="ml-auto mt-2">
                <button type="submit" class="float-right bg-primary text-white h-8 rounded-lg text-[13px] px-3 w-fit"><span>Save</span></button>
            </div>
        </div>
        
    </div>
</form>

</template>

<script setup>
import { useForm } from '@inertiajs/vue3'
import FormToggleSwitch from '@/Components/FormToggleSwitch.vue'
import FormInput from '@/Components/FormInput.vue';
import FormTextArea from '@/Components/FormTextArea.vue';
const props = defineProps({
    settings: Object
})

const emit = defineEmits(['save'])

const form = useForm({

    ai_chat_form_active: props.settings?.ai_chat_form_active ?? false,
    start_keywords: props.settings?.start_keywords ?? '',
    stop_keywords: props.settings?.stop_keywords ?? ''

})

function save()
{
    emit('save', form)
}

</script>
