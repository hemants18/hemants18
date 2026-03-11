<template>
    <SettingLayout :aimodule="aimodule" :fbmodule="fbmodule">
        <div class="md:h-[90vh]">
            <div class="flex justify-center items-center">
                <div class="md:w-[60em]">

                    <!-- OPT-IN SETTINGS -->
                    <div class="bg-white border border-slate-200 rounded-lg pt-2 text-sm mb-4 px-4 mb-20">

                        <!-- Header -->
                        <div class="w-full py-2 mb-4 mt-2 border-b pb-4">

                            <div class="flex w-full">

                                <div class="text-md">
                                    <h4 class="text-[16px]">{{$t('Enable Opt-In')}}</h4>
                                    <div class="mb-1 text-slate-500 flex items-center">
                                        <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"></path></svg>{{$t('Activate Opt-In in your conversations')}}
                                    </div>
                                </div>

                                <!-- Toggle -->
                                <div class="ml-auto">
                                    <div class="flex items-center gap-x-3">
                                        <div class="w-12 h-6 flex items-center bg-gray-300 rounded-full p-1 cursor-pointer"
                                             :class="{ 'bg-primary': props.rows?.subscription_enabled ?? false}"
                                             @click="updateStatus(props.rows?.subscription_enabled ?? false)">
                                            <div class="bg-white w-4 h-4 rounded-full shadow-md transform duration-300 ease-in-out"
                                                 :class="{ 'translate-x-6': props.rows?.subscription_enabled ?? false}">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>

                        </div>

                        <form @submit.prevent="submitForm2()" class="py-2 text-sm mb-4 pb-2">
                        <!-- Subscription Keywords -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                            <div>
                                <label class="font-medium text-slate-700">
                                    {{$t('Subscription Keywords')}}
                                </label>
                                <p class="text-xs text-slate-500 mt-1 flex items-center">
                                        <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"></path></svg>
                                    
                                    {{$t('Keywords that trigger subscription')}}
                                </p>
                                <p class="text-xs text-slate-500 mt-1">
                                    Default : START,SUBSCRIBE,YES
                                </p>
                            </div>

                            <div class="md:col-span-2">
                                <FormInput v-model="form2.subscription_keywords" :error="form2.errors.subscription_keywords" :name="''" :type="'text'" :class="'col-span-4'" placeholder="Add Keyword.."/>
                            </div>

                        </div>


                        <!-- Subscribe Message -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                            <div>
                                <label class="font-medium text-slate-700">
                                    {{$t('Subscribe Message')}}
                                </label>
                                <p class="text-xs text-slate-500 mt-1 flex items-center">
                                        <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"></path></svg>
                                    {{$t('Message sent after successful subscription')}}
                                </p>
                            </div>

                            <div class="md:col-span-2">

                                <FormTextArea v-model="form2.subscribe_message" :error="form2.errors.subscribe_message" :name="''" :type="'text'" :class="'col-span-4'"/>

                                <!-- <div class="text-right text-xs text-slate-400 mt-1">
                                    {{ form2.subscribe_message?.length || 0 }} / 1000
                                </div> -->

                            </div>

                        </div>


                        <!-- Resubscribe Message -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                            <div>
                                <label class="font-medium text-slate-700">
                                    {{$t('Resubscribe Message')}}
                                </label>
                                <p class="text-xs text-slate-500 mt-1 flex items-center">
                                        <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"></path></svg>
                                    {{$t('Sent when a contact subscribes again')}}
                                </p>
                            </div>

                            <div class="md:col-span-2">

                                <FormTextArea v-model="form2.resubscribe_message" :error="form2.errors.resubscribe_message" :name="''" :type="'text'" :class="'col-span-4'"/>

                                <!-- <div class="text-right text-xs text-slate-400 mt-1">
                                    {{ form2.resubscribe_message?.length || 0 }} / 1000
                                </div> -->

                            </div>

                        </div>


                        <!-- Unsubscribe Keywords -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                            <div>
                                <label class="font-medium text-slate-700">
                                    {{$t('Unsubscribe Keywords')}}
                                </label>
                                <p class="text-xs text-slate-500 mt-1 flex items-center">
                                        <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"></path></svg>
                                    {{$t('Keywords that stop messages')}}
                                </p>
                                <p class="text-xs text-slate-500 mt-1">
                                    Default : STOP,UNSUBSCRIBE,NO
                                </p>
                            </div>

                            <div class="md:col-span-2">

                                <FormInput v-model="form2.unsubscribe_keywords" :error="form2.errors.unsubscribe_keywords" :name="''" :type="'text'" :class="'col-span-4'" placeholder="Add Keyword.."/>

                            </div>

                        </div>


                        <!-- Unsubscribe Message -->
                        <div class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-6">

                            <div>
                                <label class="font-medium text-slate-700">
                                    {{$t('Unsubscribe Message')}}
                                </label>
                                <p class="text-xs text-slate-500 mt-1 flex items-center">
                                        <svg class="mr-2" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"></path></svg>
                                    {{$t('Sent when contact unsubscribes')}}
                                </p>
                            </div>

                            <div class="md:col-span-2">

                                <FormTextArea v-model="form2.unsubscribe_message" :error="form2.errors.unsubscribe_message" :name="''" :type="'text'" :class="'col-span-4'"/>

                                <!-- <div class="text-right text-xs text-slate-400 mt-1">
                                    {{ getCharsCount(form2.unsubscribe_message) || 0 }} / 1000
                                </div> -->

                            </div>

                        </div>

                        <div class="flex px-4 pt-1 pb-2">
                            <div class="ml-auto">
                                <button type="submit" class="float-right rounded-md bg-primary px-3 py-2 text-sm text-white shadow-sm hover:shadow-md hover:bg-primary focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600" :disabled="form2.processing">
                                    <svg v-if="form2.processing" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 2A10 10 0 1 0 22 12A10 10 0 0 0 12 2Zm0 18a8 8 0 1 1 8-8A8 8 0 0 1 12 20Z" opacity=".5"/><path fill="currentColor" d="M20 12h2A10 10 0 0 0 12 2V4A8 8 0 0 1 20 12Z"><animateTransform attributeName="transform" dur="1s" from="0 12 12" repeatCount="indefinite" to="360 12 12" type="rotate"/></path></svg>
                                    <span v-else>{{ $t('Save') }}</span>
                                </button>
                            </div>
                        </div>
                    </form>
                    </div>
                </div>
            </div>
        </div>
    </SettingLayout>
</template>

<script setup>

import { ref } from 'vue'
import { router, useForm } from "@inertiajs/vue3";
import SettingLayout from "./Layout.vue";
import FormInput from '@/Components/FormInput.vue';
import FormTextArea from '@/Components/FormTextArea.vue';

const props = defineProps(['rows'])


const form2 = useForm({
    subscription_keywords : props.rows?.subscription_keywords ?? '',
    unsubscribe_keywords : props.rows?.unsubscribe_keywords ?? '',
    subscribe_message : props.rows?.subscribe_message ?? '',
    resubscribe_message : props.rows?.resubscribe_message ?? '',
    unsubscribe_message : props.rows?.unsubscribe_message ?? '',
});


const parseJson = () => {
    return JSON.parse(props.organization?.metadata);
}

function updateStatus(value)
{
    router.post('optin/toggle', {
        enabled: value
    })
}

function submitForm2()
{
    form2.post('optin', {
        preserveScroll: true,
    })
}

</script>
