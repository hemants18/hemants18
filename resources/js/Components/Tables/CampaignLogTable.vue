<script setup>
    import 'vue3-toastify/dist/index.css';
    import { ref, watch, computed } from 'vue';
    import debounce from 'lodash/debounce';
    import { router } from '@inertiajs/vue3';
    import FormSelect from '@/Components/FormSelect.vue';
    import Modal from '@/Components/Modal.vue';
    import Table from '@/Components/Table.vue';
    import TableHeader from '@/Components/TableHeader.vue';
    import TableHeaderRow from '@/Components/TableHeaderRow.vue';
    import TableHeaderRowItem from '@/Components/TableHeaderRowItem.vue';
    import TableBody from '@/Components/TableBody.vue';
    import TableBodyRow from '@/Components/TableBodyRow.vue';
    import TableBodyRowItem from '@/Components/TableBodyRowItem.vue';
     import { useForm } from "@inertiajs/vue3";

    const props = defineProps({
        rows: {
            type: Object,
            required: true,
        },
        filters: {
            type: Object
        },
        uuid: {
            type: String
        }
    });
    
    const params = ref({
        search: props.filters.search,
    });

    const logs = ref(null);
    const messageStatus = ref(null);
    const isOpenModal = ref(false);
    const isSearching = ref(false);
    const isLoading = ref(false);
    const emit = defineEmits(['delete']);

    const form = useForm({
        contact_ids: [],
        uuid: props.uuid,
        schedule_at: null,
        mode: 'retry',
    })

    const clearSearch = () => {
        params.value.search = null;
        runSearch();
    }

    const search = debounce(() => {
        isSearching.value = true;
        runSearch();
    }, 1000);

    const runSearch = () => {
        router.visit('/campaigns/' + props.uuid, {
            method: 'get',
            data: params.value,
        })
    }

    const openModal = (status, value) => {
        messageStatus.value = status;
        logs.value = value;
        isOpenModal.value = true;
    }

    const getStatus = (metadata) => {
        return JSON.parse(metadata).status;
    }

    const getErrorDetails = (metadata) => {
        return JSON.parse(metadata);
    }

    const selected = ref([]);     // selected row IDs
    const checkAll = ref(false);
    const isRetryModalOpen = ref(false);

    // Select rows by status
    const selectByStatus = (status) => {
      const ids = props.rows.data
        .filter(row => {
          if (status === 'read') {
            return row.status === 'success' && row.chat?.status === 'read';
          }
          if (status === 'failed') {
            return row.status === 'failed' || row.chat?.status === 'failed';
          }
          return false;
        })
        .map(row => row.id);

      selected.value =
        ids.every(id => selected.value.includes(id)) ? [] : ids;
    };

    // Get only IDs from props rows
    const rowIds = computed(() =>
      props.rows.data.map(row => row.id)
    );

    // Toggle all
    const toggleAll = () => {
      selected.value = checkAll.value ? [...rowIds.value] : [];
    };

    // Auto sync checkAll checkbox
    watch(selected, () => {
      checkAll.value =
        selected.value.length === rowIds.value.length &&
        rowIds.value.length > 0;
    });

    const openRetryModal = () => {
      isRetryModalOpen.value = true;
    };

    const closeRetryModal = () => {
      isRetryModalOpen.value = false;
      rescheduleAt.value = nul
    };

    const submitRetry = () => { 
        isLoading.value = true;
        form.contact_ids = selected.value;
        console.log(form);
        form.post('/campaigns/reschedule', { 
            onFinish: () => { 
                isLoading.value = false; 
            } 
        }); 
    }

    const minDateTime = computed(() => {
      const now = new Date()
      now.setMinutes(now.getMinutes() - now.getTimezoneOffset())
      return now.toISOString().slice(0, 16)
    })
</script>
<template>
    <div class="flex items-center justify-between mb-6">
        <div class="bg-white flex items-center shadow-sm h-10 w-80 rounded-[0.5rem] mb-6 text-sm">
            <span class="pl-3">
                <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m15 15l6 6m-11-4a7 7 0 1 1 0-14a7 7 0 0 1 0 14Z"/></svg>
            </span>
            <input @input="search" v-model="params.search" type="text" class="outline-none px-4 w-full" :placeholder="$t('Search campaigns')">
            <button v-if="isSearching === false && params.search" @click="clearSearch" type="button" class="pr-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="currentColor" d="M12 2C6.5 2 2 6.5 2 12s4.5 10 10 10s10-4.5 10-10S17.5 2 12 2zm3.7 12.3c.4.4.4 1 0 1.4c-.4.4-1 .4-1.4 0L12 13.4l-2.3 2.3c-.4.4-1 .4-1.4 0c-.4-.4-.4-1 0-1.4l2.3-2.3l-2.3-2.3c-.4-.4-.4-1 0-1.4c.4-.4 1-.4 1.4 0l2.3 2.3l2.3-2.3c.4-.4 1-.4 1.4 0c.4.4.4 1 0 1.4L13.4 12l2.3 2.3z"/></svg>
            </button>
            <span v-if="isSearching" class="pr-2">
                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><circle cx="12" cy="3.5" r="1.5" fill="currentColor" opacity="0"><animateTransform attributeName="transform" calcMode="discrete" dur="2.4s" repeatCount="indefinite" type="rotate" values="0 12 12;90 12 12;180 12 12;270 12 12"/><animate attributeName="opacity" dur="0.6s" keyTimes="0;0.5;1" repeatCount="indefinite" values="1;1;0"/></circle><circle cx="12" cy="3.5" r="1.5" fill="currentColor" opacity="0"><animateTransform attributeName="transform" begin="0.2s" calcMode="discrete" dur="2.4s" repeatCount="indefinite" type="rotate" values="30 12 12;120 12 12;210 12 12;300 12 12"/><animate attributeName="opacity" begin="0.2s" dur="0.6s" keyTimes="0;0.5;1" repeatCount="indefinite" values="1;1;0"/></circle><circle cx="12" cy="3.5" r="1.5" fill="currentColor" opacity="0"><animateTransform attributeName="transform" begin="0.4s" calcMode="discrete" dur="2.4s" repeatCount="indefinite" type="rotate" values="60 12 12;150 12 12;240 12 12;330 12 12"/><animate attributeName="opacity" begin="0.4s" dur="0.6s" keyTimes="0;0.5;1" repeatCount="indefinite" values="1;1;0"/></circle></svg>
            </span>
        </div>
        <button type="button" :disabled="selected.length === 0" @click="openRetryModal" class="px-4 py-2 text-sm rounded
               bg-primary text-white disabled:bg-gray-300 disabled:cursor-not-allowed">
                {{ $t('Retry Campaign') }} ({{ selected.length }})
      </button>

    </div>
    <div class="flex gap-2 mb-4">
          <button
            type="button"
            @click="selectByStatus('failed')"
            class="px-3 py-1 text-xs bg-red-600 text-white rounded"
          >
            {{ $t('Failed') }}
          </button>

          <button
            type="button"
            @click="selectByStatus('read')"
            class="px-3 py-1 text-xs bg-green-600 text-white rounded"
          >
            {{ $t('Read') }}
          </button>

          <button
            type="button"
            @click="selected = []"
            class="px-3 py-1 text-xs bg-gray-300 rounded"
          >
            {{ $t('Clear') }}
          </button>
    </div>

    <Table :rows="rows">
        <TableHeader>
            <TableHeaderRow>
                <TableHeaderRowItem :position="'first'" class="hidden sm:table-cell"><input type="checkbox" v-model="checkAll" @change="toggleAll"></TableHeaderRowItem>
                <TableHeaderRowItem>{{ $t('Contact') }}</TableHeaderRowItem>
                <TableHeaderRowItem>{{ $t('Phone') }}</TableHeaderRowItem>
                <TableHeaderRowItem class="hidden sm:table-cell">{{ $t('Last updated') }}</TableHeaderRowItem>
                <TableHeaderRowItem>{{ $t('Status') }}</TableHeaderRowItem>
                <TableHeaderRowItem :position="'last'"></TableHeaderRowItem>
            </TableHeaderRow>
        </TableHeader>
        <TableBody>
            <TableBodyRow v-for="(item, index) in rows.data" :key="index">
                <TableBodyRowItem :position="'first'" class="hidden sm:table-cell"><input type="checkbox" :value="item.id" v-model="selected"></TableBodyRowItem>
                <TableBodyRowItem>{{ item.contact.full_name }}</TableBodyRowItem>
                <TableBodyRowItem>
                    {{ item.contact.phone }}
                </TableBodyRowItem>
                <TableBodyRowItem class="hidden sm:table-cell">
                    <span v-if="item.status === 'success'" class="border-b border-dashed border-black">{{ item.chat.created_at }}</span>
                    <span v-else class="border-b border-dashed border-black">{{ item.created_at }}</span>
                </TableBodyRowItem>
                <TableBodyRowItem>
                    <span class="px-2 py-1 text-xs rounded-md capitalize" :class="item.status === 'success' && item.chat.status !== 'failed' ? 'bg-green-700 text-white' : 'bg-red-400 text-white'">
                        {{ item.status === 'success' ? item.chat.status : item.status }}
                    </span>
                </TableBodyRowItem>
                <TableBodyRowItem>
                    <div @click="openModal(item.status, item.status === 'success' ? item.chat?.logs : item.metadata)" class="flex items-center underline cursor-pointer">
                        <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24"><g fill="currentColor"><path d="M11 10.98a1 1 0 1 1 2 0v6a1 1 0 1 1-2 0zm1-4.929a1 1 0 1 0 0 2a1 1 0 0 0 0-2"/><path fill-rule="evenodd" d="M12 2C6.477 2 2 6.477 2 12s4.477 10 10 10s10-4.477 10-10S17.523 2 12 2M4 12a8 8 0 1 0 16 0a8 8 0 0 0-16 0" clip-rule="evenodd"/></g></svg>
                        <span>{{ $t('More info') }}</span>
                    </div>
                </TableBodyRowItem>
            </TableBodyRow>
        </TableBody>
    </Table>
    <Modal :label="modalLabel" :isOpen=isOpenModal>
        <span class="text-xl text-slate-600">{{ $t('Message info') }}</span>
        <div class="max-w-md w-full space-y-8">
            <div class="mt-8 space-y-2">
                <div v-if="messageStatus === 'success'" v-for="(log, index) in logs" class="text-sm border-b pb-2">
                    <div class="flex items-center capitalize">
                        <svg class="mr-1" xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="1.5" d="m1.75 9.75l2.5 2.5m3.5-4l2.5-2.5m-4.5 4l2.5 2.5l6-6.5"/></svg>
                        <span>{{ $t(getStatus(log.metadata)) }}</span>
                    </div>
                    <div>{{ log.created_at }}</div>

                    <div v-if="getStatus(log.metadata) === 'failed'">
                        <div class="text-sm mb-3 bg-red-800 p-2 rounded text-white">Error: {{ getErrorDetails(log.metadata).errors[0].message }}</div>
                    </div>

                </div>
                <div v-else-if="messageStatus === 'failed'">
                    <div class="text-sm mb-3 bg-red-800 p-2 rounded text-white">Error: {{ getErrorDetails(logs).data.error.message }}</div>
                    <div v-if="getErrorDetails(logs).data?.error?.error_data?.details" class="text-sm">{{ getErrorDetails(logs).data?.error?.error_data?.details }}</div>
                    <div v-else>{{ getErrorDetails(logs).data.error.message }}</div>
                </div>


            </div>
        </div>

        <div class="mt-5 grid grid-cols-1 gap-x-6 gap-y-4">
            <div class="mt-2 w-full">
                <button type="button" @click="isOpenModal = false" class="inline-flex float-right justify-center rounded-md border border-transparent bg-slate-50 px-4 py-2 text-sm text-slate-500 hover:bg-slate-200 focus:outline-none focus-visible:ring-2 focus-visible:ring-blue-500 focus-visible:ring-offset-2">{{ $t('Close') }}</button>
            </div>
        </div>
    </Modal>

    <Modal :isOpen="isRetryModalOpen">
      <div class="space-y-4">

        <h2 class="text-lg font-semibold text-slate-700">
          {{ $t('Retry / Reschedule Campaign') }}
        </h2>

        <p class="text-sm text-slate-600">
          {{ $t('You have selected') }}
          <strong class="text-primary">{{ selected.length }}</strong>
          {{ $t('contacts') }}
        </p>

        <!-- Schedule datetime -->
        <div>
          <label class="text-sm text-slate-600 block mb-1">
            {{ $t('Schedule Date & Time (optional)') }}
          </label>


          <input
            type="datetime-local"
            v-model="form.schedule_at"
            :min="minDateTime"
            class="w-full border rounded px-3 py-2 text-sm"
          />

          <p class="text-xs text-slate-500 mt-1">
            {{ $t('Leave empty to retry immediately') }}
          </p>
        </div>

        <div class="flex justify-end gap-3 pt-4">
          <button
            type="button"
            @click="closeRetryModal"
            class="px-4 py-2 text-sm rounded bg-gray-100 text-gray-700"
          >
            {{ $t('Cancel') }}
          </button>

          <!-- <button
            type="button"
            @click="submitRetry"
            :disabled="selected.length === 0"
            class="px-4 py-2 text-sm rounded bg-primary text-white disabled:opacity-50"
          >
            {{ rescheduleAt ? $t('Reschedule') : $t('Retry Now') }}
          </button> -->

          <button
              @click="submitRetry"
              :disabled="isLoading"
              class="px-4 py-2 text-sm rounded bg-primary text-white disabled:opacity-50"
            >
              {{ isLoading ? 'Processing...' : (form.schedule_at ? 'Reschedule' : 'Retry Now') }}
            </button>


        </div>

      </div>
    </Modal>
</template>
  