<template>
    <AppLayout>
        <div class="bg-white md:bg-inherit pt-10 px-4 md:pt-8 md:p-8 rounded-[5px] text-[#000] h-full md:overflow-y-auto">
            <div class="flex justify-between">
                <div>
                    <h1 class="text-xl mb-1">{{ $t('Users') }}</h1>
                    <p class="mb-6 flex items-center text-sm leading-6 text-gray-600">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"/></svg>
                        <span class="ml-1 mt-1">{{ $t('Manage user accounts') }}</span>
                    </p>
                </div>
                <div>
                    <Link href="/admin/users/create" class="rounded-md bg-indigo-600 px-3 py-2 text-sm text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">{{ $t('Add user') }}</Link>
                </div>
            </div>
            <UserTable :rows="props.rows" :filters="props.filters" :type="'user'" @verify="openModal" />
        </div>

         <!-- <OtpModal 
            v-model="isOpenFormModal" 
            :label="label" 
            :url="formUrl" 
            :form="form" 
            :formInputs="formInputs"
            :formMethod="formMethod"
            :buttonLabel="submitButtonLabel"
            @closeModal="isOpenFormModal = false"
        /> -->

        <OtpModal
            v-model="isOpenModal"
            :label="label"
            :url="url"
            :form="step === 1 ? form : otpForm"
            :formInputs="formInputs"
            :formMethod="formMethod"
            :buttonLabel="buttonLabel"
            @closeModal="closeModal"
        />


    </AppLayout>
</template>
<script setup>
    import AppLayout from "./../Layout/App.vue";
    import axios from "axios";
    import { ref, reactive } from 'vue';
    import { useForm } from "@inertiajs/vue3";
    import { Link } from "@inertiajs/vue3";
    import UserTable from '@/Components/Tables/UserTable.vue';
    import OtpModal from '@/Components/OtpModal.vue';
    import FormSelect from '@/Components/FormSelect.vue';
    import { trans } from 'laravel-vue-i18n';

    const props = defineProps({ 
        allowCreate: {
            type: Boolean,
            default: true
        }, 
        title: String, 
        rows: Object, 
        filters: Object 
    });
    const isOpenModal = ref(false);
    const label = ref('');
    const url = ref('');
    const formMethod = ref('post');
    const buttonLabel = ref('Send OTP');

    // MAIN FORM (step 1)
    const form = reactive({
        phone: null,
    });

    // OTP FORM (step 2)
    const otpForm = reactive({
        phone: null,
        otp: null,
    });

    const step = ref(1);

    const openModal = (key, formData = {}) => {
        step.value = 1;

        label.value = 'Whatsapp Mobile Verify';
        url.value = '/admin/users/send-otp';
        formMethod.value = 'post';
        buttonLabel.value = 'Send OTP';

        if (key != null) {
            label.value = 'Whatsapp Mobile Verify';
            url.value = '/admin/users/' + key;
            formMethod.value = 'put';
            getRow();
        } else {
            form.phone = null;
            isOpenModal.value = true;
        }
    }

    function getRow() {
        axios.get(url.value).then((response) => {
            const { data } = response;
            for (const key in data.item.user) {
                if (form.hasOwnProperty(key)) {
                    form[key] = data.item.user[key];
                }
            }

            label.value = 'Whatsapp Mobile Verify';
            url.value = '/admin/users/send-otp';
            formMethod.value = 'post';

            isOpenModal.value = true;
        })
        .catch((error) => {
            // console.error('Error:', error);
        });
    }   

    const closeModal = (success) => {
        console.log('dddd'+success);
        isOpenModal.value = false;

        if (success && step.value === 1) {
            
            otpForm.phone = form.phone; 

            step.value = 2;

            label.value = 'Enter OTP';
            url.value = '/admin/users/verify-otp';
            formMethod.value = 'post';
            buttonLabel.value = 'Verify OTP';

            formInputs.value = otpFormInputs;

            isOpenModal.value = true;
        }
    };

    // Step 1 Inputs
    const formInputs = ref([
        {
            inputType: 'FormInput',
            name: 'phone',
            label: trans('Mobile no'),
            type: 'text',
            className: 'sm:col-span-12',
        }
    ]);

    // Step 2 Inputs
    const otpFormInputs = [
        {
            inputType: 'FormInput',
            name: 'otp',
            label: 'Enter OTP',
            type: 'text',
            className: 'sm:col-span-12',
        }
    ];

</script>