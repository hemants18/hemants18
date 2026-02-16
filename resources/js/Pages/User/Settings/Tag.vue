<template>
    <SettingLayout>
        <div class="md:h-[90vh]">
            <div class="flex justify-center items-center">
                <div class="md:w-[60em]">
                    
                    <div class="bg-white border border-slate-200 rounded-lg py-2 text-sm mb-4 pb-4 px-4 mb-20">
                        <div class="w-full py-2 mb-2 mt-2">
                            <div class="flex w-full mb-4">
                                <div class="text-md">
                                    <h4 class="text-[16px]">{{ $t('Tag') }}</h4>
                                    <span class="flex items-center mt-1 text-slate-500">
                                        {{ $t('Create Tag workflow in your conversations') }}
                                    </span> 
                                </div>
                                <div class="ml-auto">
                                    <button @click="openModal()" class="float-right rounded-md bg-primary px-3 py-2 text-sm text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">{{ $t('Add tags') }}</button>
                                </div>
                            </div>
                            <div class="w-5/5">
                                <!-- Table Component-->
                                <TagTable :rows="props.rows" @edit="openModal" @delete="openAlert"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <Modal :label="label" :isOpen=isOpenFormModal>
            <div class="mt-5 grid grid-cols-1 gap-x-6 gap-y-4">
                <form @submit.prevent="submitForm()" class="gap-y-4">
                    <div class="grid grid-cols gap-y-4">
                        <FormInput v-model="form.name" :name="$t('Label')" :error="form.errors.name" :type="'text'" :class="'col-span-6'"/>

                        <FormInput v-model="form.color" :name="$t('Color')" :error="form.errors.color" :type="'color'" :class="'col-span-6'"/>

                    </div>
                    
                    <div class="mt-4 flex">
                        <button type="button" @click.self="isOpenFormModal = false" class="inline-flex justify-center rounded-md border border-transparent bg-slate-50 px-4 py-2 text-sm text-slate-500 hover:bg-slate-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:ring-offset-2 mr-4">{{ $t('Cancel') }}</button>
                        <button 
                            :class="['inline-flex justify-center rounded-md border border-transparent bg-primary px-4 py-2 text-sm text-white focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:ring-offset-2', { 'opacity-50': isLoading }]"
                            :disabled="isLoading"
                        >
                            <svg v-if="isLoading" xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="currentColor" d="M12 2A10 10 0 1 0 22 12A10 10 0 0 0 12 2Zm0 18a8 8 0 1 1 8-8A8 8 0 0 1 12 20Z" opacity=".5"/><path fill="currentColor" d="M20 12h2A10 10 0 0 0 12 2V4A8 8 0 0 1 20 12Z"><animateTransform attributeName="transform" dur="1s" from="0 12 12" repeatCount="indefinite" to="360 12 12" type="rotate"/></path></svg>
                            <span v-else>{{ $t('Save') }}</span>
                        </button>
                    </div>
                </form>
            </div>
        </Modal>
    </SettingLayout>
</template>
<script setup>
    import SettingLayout from "./Layout.vue";
    import axios from "axios";
    import { ref, watch } from 'vue';
    import { useForm } from "@inertiajs/vue3";
    import { trans } from 'laravel-vue-i18n';
    import draggable from 'vuedraggable';
    import FormModal from '@/Components/FormModalModified.vue';
    import Modal from '@/Components/Modal.vue';
    import FormInput from '@/Components/FormInput.vue';
    import FormSelect from '@/Components/FormSelect.vue';
    import FormTextArea from '@/Components/FormTextArea.vue';
    import TagTable from '@/Components/Tables/TagTable.vue';

    const props = defineProps({ rows: Object, filters: Object, settings: Object });
    const isOpenFormModal = ref(false);
    const label = ref('Add Contact Field');
    const formUrl = ref('/settings/tags');
    const formMethod = ref('post');
    const isLoading = ref(false);

    const form = useForm({
        name: null,
        color: null
    });


    const openModal = (key, formData = {}) => {
        label.value = trans('Add tag field');
        formUrl.value = '/settings/tags';
        formMethod.value = 'post';
        
        if (key != null) {
            label.value = trans('Edit tag field');
            formUrl.value = '/settings/tags/' + key+'/edit';
            formMethod.value = 'put';
            getRow();
        } else {
            // id = 0;
            form.name = null;
            form.color = null;
            isOpenFormModal.value = true;
        }
    }

    function getRow() {
        axios.get(formUrl.value).then((response) => {
            const { data } = response;
            if(data.item){
            	formUrl.value = '/settings/tags/' + data.item.id;
                form['name'] = data.item.name;
                form['color'] = data.item.color;
            }
            isOpenFormModal.value = true;
        })
        .catch((error) => {
            // console.error('Error:', error);
        });
    }

  

    const submitForm = async () => {
        isLoading.value = true;

        if(formMethod.value == 'post'){
            form.post(formUrl.value, {
                preserveScroll: true,
                onFinish: () => {
                    isLoading.value = false;
                },
                onSuccess: () => {
                    isOpenFormModal.value = false;
                }
            })
        } else {
            form.put(formUrl.value, {
                preserveScroll: true,
                onFinish: () => {
                    isLoading.value = false;
                },
                onSuccess: () => {
                    isOpenFormModal.value = false;
                }
            })
        }
    };
</script>