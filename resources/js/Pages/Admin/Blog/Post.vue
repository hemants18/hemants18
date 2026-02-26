<template>
    <AppLayout>
        <div class="flex justify-between">
            <div>
                <h2 class="text-xl mb-1">{{ $t('Blog') }}</h2>
                <p class="mb-6 flex items-center text-sm leading-6 text-gray-600">
                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"/></svg>
                    <span class="ml-1 mt-1">{{ $t('Explore news, guides & updates') }}</span>
                </p>
            </div>
            <div>
                <button @click="openModal()" type="button" class="rounded-md bg-indigo-600 px-3 py-2 text-sm text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">{{ $t('Add Blog') }}</button>
            </div>
        </div>

        <!-- Table Component-->
        <BlogTable :filters="filters" :rows="props.rows" @edit="openModal" @delete="openAlert" />

        <!-- Form Modal Component-->
        <FormModal 
            v-model="isOpenFormModal" 
            :label="label" 
            :url="formUrl" 
            :form="form" 
            :formInputs="formInputs"
            :formMethod="formMethod"
            @closeModal="isOpenFormModal = false"
        />
    </AppLayout>
</template>
<script setup>
    import AppLayout from "./Layout/App.vue";
    import axios from "axios";
    import { ref } from 'vue';
    import BlogTable from '@/Components/Tables/BlogTable.vue';
    import FormModal from '@/Components/FormModalModified.vue';
    import { trans } from 'laravel-vue-i18n';

    const props = defineProps({filters : Array, rows: Object, category : Array, tags : Array, author : Array });
    const isOpenFormModal = ref(false);
    const label = ref('Add Blog');
    const formUrl = ref('/admin/blog/posts');
    const formMethod = ref('post');

    const form = {
        title: null,
        content: null,
        image: null,
        is_featured: null,
        published: null,
        publish_date: null,
        meta_title: null,
        meta_description: null,
        meta_keywords: null,
        author_id: null,
        tags: null,
        category_id: null,
    };

    const openModal = (key, formData = {}) => {
        label.value = trans('Add Blog');
        formUrl.value = '/admin/blog/posts';
        formMethod.value = 'post';

        if (key != null) {
            label.value = trans('Edit Blog');
            formUrl.value = '/admin/blog/posts/' + key;
            formMethod.value = 'put';
            getRow();
        } else {
            form.title = null;
            form.content = null;
            form.image = null;
            form.is_featured = null;
            form.published = null;
            form.meta_title = null;
            form.meta_description = null;
            form.meta_keywords = null;
            form.author_id = null;
            form.tags = null;
            form.category_id = null;

            isOpenFormModal.value = true;
        }
    }

    function getRow() {

        axios.get(formUrl.value).then((response) => {

            const item = response.data.item;
            for (const key in item) {

                if (form.hasOwnProperty(key) && key !== 'tags') {
                    form[key] = item[key];
                }

            }
            if(item.tags ){
                form.tags = JSON.parse(item.tags).map(tag => ({
                    id: tag,
                    name: tag
                }));

            } 
            isOpenFormModal.value = true;
        });

    }


    const formInputs = [
        {
            inputType: 'FormInput',
            name: 'title',
            label: trans('Title'),
            type: 'text',
            className: 'sm:col-span-6',
        },

        {
            inputType: 'FormSelect',
            options : props.category,
            name: 'category_id',
            label: trans('Category'),
            type: 'text',
            className: 'sm:col-span-3',
        },

        {
            inputType: 'FormSelect',
            options : props.author,
            name: 'author_id',
            label: trans('Author'),
            type: 'text',
            className: 'sm:col-span-3',
        },

        {
            inputType: 'FormMultiSelect',
            options : props.tags,
            name: 'tags',
            label: trans('Tags'),
            type: 'text',
            className: 'sm:col-span-6',
        },

        {
            inputType: 'FormTextEditor',
            name: 'content',
            label: trans('Content'),
            type: 'textarea',
            className: 'sm:col-span-6',
        },
        {
            inputType: 'FormInput',
            name: 'meta_title',
            label: trans('Meta Title'),
            type: 'text',
            className: 'sm:col-span-3',
        },
        {
            inputType: 'FormInput',
            name: 'meta_keywords',
            label: trans('Meta Keywords'),
            type: 'text',
            className: 'sm:col-span-3',
        },
        {
            inputType: 'FormTextEditor',
            name: 'meta_description',
            label: trans('Meta Description'),
            type: 'text',
            className: 'sm:col-span-6',
        },
        // {
        //     inputType: 'FormInput',
        //     name: 'publish_date',
        //     label: trans('Publish Date'),
        //     type: 'datetime-local',
        //     className: 'sm:col-span-6',
        // },
        {
            inputType: 'FormToggleSwitchModified',
            name: 'is_featured',
            label: trans('Featured'),
            type: 'toggle',
            className: 'sm:col-span-3',
        },
        {
            inputType: 'FormToggleSwitchModified',
            name: 'published',
            label: trans('Published'),
            type: 'toggle',
            className: 'sm:col-span-3',
        },
        
        {
            inputType: 'FormImage',
            name: 'image',
            label: trans('Image'),
            type: 'file',
            className: 'sm:col-span-6',
        },
    ];
</script>