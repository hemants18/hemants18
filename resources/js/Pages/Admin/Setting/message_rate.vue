<template>
    <AppLayout>
        <div>
            <h2 class="text-xl mb-1">{{ $t('Message Rates') }}</h2>
            <p class="mb-6 flex items-center text-sm leading-6">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"/></svg>
                <span class="ml-1 mt-1">{{ $t('Configure simple and transparent pricing') }}</span>
            </p>
        </div>
        <form @submit.prevent="submitForm()" enctype="multipart/form-data">
            <div class="space-y-12">
                <div class="pb-12">
                    <div class="grid gap-6 grid-cols-2 pb-10 border-b md:w-2/3">
                        <FormInput v-model="form.marketing" :name="$t('Marketing')" :error="form.errors.marketing" :type="'number'" :min="0" step="0.01" :class="'col-span-2'"/>
                        <FormInput v-model="form.utility" :name="$t('Utility')" :error="form.errors.utility" :type="'number'" :min="0" step="0.01" :class="'col-span-2'"/>
                        <FormInput v-model="form.authentication" :name="$t('Authentication')" :error="form.errors.authentication" :type="'number'" :min="0" step="0.01" :class="'col-span-2'"/>

                        <FormInput v-model="form.service" :name="$t('Service')" :error="form.errors.service" :type="'number'" :min="0" step="0.01" :class="'col-span-2'"/>
                    </div>

                    <div class="mt-6 flex items-center justify-end gap-x-6 md:w-2/3">
                        <!-- <button type="button" class="text-sm leading-6 text-gray-900">{{ $t('Cancel') }}</button> -->
                        <button
                            :class="['inline-flex justify-center rounded-md border border-transparent bg-primary px-4 py-2 text-sm text-white focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:ring-offset-2', { 'opacity-50': isLoading }]"
                            :disabled="isLoading"
                        >
                            <svg v-if="isLoading" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 2A10 10 0 1 0 22 12A10 10 0 0 0 12 2Zm0 18a8 8 0 1 1 8-8A8 8 0 0 1 12 20Z" opacity=".5"/><path fill="currentColor" d="M20 12h2A10 10 0 0 0 12 2V4A8 8 0 0 1 20 12Z"><animateTransform attributeName="transform" dur="1s" from="0 12 12" repeatCount="indefinite" to="360 12 12" type="rotate"/></path></svg>
                            <span v-else>{{ $t('Save') }}</span>
                        </button>
                    </div>
                </div>
            </div>
        </form>
    </AppLayout>
</template>
<script setup>
    import AppLayout from "./Layout/App.vue";
    import { defineProps, ref } from 'vue';
    import { useForm } from "@inertiajs/vue3";
    import FormInput from '@/Components/FormInput.vue';
    

    const props = defineProps({
        config: {
            type: Array,
            required: true
        }
    });

    const getValueByKey = (key) => {
        const found = props.config.find(item => item.key === key);
        return found ? found.value : '';
    };

    
    const isLoading = ref(false);

    const form = useForm({
        _method: 'put',
        marketing: getValueByKey('marketing'),
        utility: getValueByKey('utility'),
        authentication: getValueByKey('authentication'),
        service: getValueByKey('service')
    })

    const submitForm = async () => {
        form.post('/admin/settings?type=message_rate', {
            preserveScroll: true,
        })
    };
</script>