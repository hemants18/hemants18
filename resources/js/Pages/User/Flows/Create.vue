<template>
    <AppLayout>
        <div class="bg-gray-50 pt-8 px-6 md:p-10 h-full">

            <!-- HEADER -->
            <div class=" mx-auto flex justify-between items-center mb-8">
                <div>
                    <h2 class="text-2xl font-semibold text-gray-900">
                        {{ $t('Create Flow') }}
                    </h2>
                    <p class="mt-1 flex items-center text-sm text-gray-500">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18"
                            viewBox="0 0 24 24">
                            <path fill="none" stroke="currentColor" stroke-linecap="round"
                                stroke-linejoin="round" stroke-width="2"
                                d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z" />
                        </svg>
                        <span class="ml-1">
                            {{ $t('Create automation using your own criteria') }}
                        </span>
                    </p>
                </div>

                <Link href="/automation/flows"
                    class="flex items-center space-x-2 rounded-lg bg-white border px-4 py-2 text-sm text-gray-700 shadow-sm hover:bg-gray-100">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                        viewBox="0 0 16 16">
                        <path fill="currentColor"
                            d="M5.841 5.28a.75.75 0 0 0-1.06-1.06L1.53 7.47L1 8l.53.53l3.25 3.25a.75.75 0 0 0 1.061-1.06l-1.97-1.97H24.25a.75.75 0 0 0 0-1.5H3.871l1.97-1.97Z" />
                    </svg>
                    <span>{{ $t('Back') }}</span>
                </Link>
            </div>

            <!-- CARD FORM -->
            <div class=" mx-auto bg-white border rounded-xl shadow-sm p-8">

                <form @submit.prevent="submitForm()">

                    <!-- NAME FIELD -->
                    <div class="grid grid-cols-12 gap-6 items-center pb-6 border-b">
                        <div class="col-span-4">
                            <h3 class="text-sm font-medium text-gray-700">
                                {{ $t('Flow Name') }}
                            </h3>
                            <p class="text-xs text-gray-500 mt-1">
                                Give your automation a meaningful name.
                            </p>
                        </div>

                        <div class="col-span-8">
                            <FormInput
                                v-model="form.name"
                                :type="'text'"
                                :error="form.errors.name"
                                :class="'w-full'"
                                :labelClass="'mb-0'"
                                placeholder="e.g. Welcome Message Flow"
                            />
                        </div>
                    </div>

                    <!-- SAVE BUTTON -->
                    <div class="flex justify-end mt-6">
                        <button type="submit"
                            class="flex items-center space-x-2 rounded-lg bg-black px-5 py-2.5 text-sm text-white hover:bg-gray-800 shadow">
                            <span>{{ $t('Save') }}</span>
                        </button>
                    </div>

                </form>
            </div>

        </div>
    </AppLayout>
</template>

<script setup>
    import AppLayout from '../Layout/App.vue';
    import { Link, useForm } from "@inertiajs/vue3";
    import { ref } from 'vue';
    import { trans } from 'laravel-vue-i18n';
    import FormInput from '@/Components/FormInput.vue';

    const props = defineProps(['placeholders']);
    const form = useForm({
        'name' : null,
    });
    const submitForm = () => {
        form.post('/automation/flows/save', {
            preserveScroll: true,
            onSuccess: () => form.reset(),
        })
    }
</script>