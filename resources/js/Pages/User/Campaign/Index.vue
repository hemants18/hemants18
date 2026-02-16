<template>
    <AppLayout>
        <div class="bg-white md:bg-inherit pt-0 px-4 md:pt-8 md:p-8 rounded-[5px] text-[#000] overflow-y-scroll capitalize">
            <div class="md:flex justify-between mt-8 md:mt-0 hidden">
                <div>
                    <h2 class="text-xl mb-1">{{ $t('Campaigns') }}</h2>
                    <p class="md:flex items-center text-sm leading-6 text-gray-600 hidden">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"/></svg>
                        <span class="ml-1 mt-1">{{ $t('Add campaigns') }}</span>
                    </p>
                    <p class="mb-6 flex items-center leading-6">
                        <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24">
                            <path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"/>
                        </svg>

                        <span class="ml-1 text-sm mt-1">
                            {{ $t('Campaigns') }} {{ $t('Plan details') }}:
                            <small class="text-indigo-600 ml-1">
                                {{ plan.label }}
                            </small>
                        </span>
                    </p>
                </div>
                <div>
                    <Link href="/campaigns/create" v-if="plan.isUnlimited || plan.remaining > 0" class="rounded-md bg-primary px-3 py-2 text-sm text-white shadow-sm focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 md:block hidden">{{ $t('Create campaign') }}</Link>
                </div>
            </div>

            <div class="grid grid-cols-2 md:grid-cols-4 gap-4 mb-6">
                <div
                    v-for="(count, status) in props.statusSummary"
                    :key="status"
                    class="bg-white rounded-md p-4 shadow flex items-center justify-between"
                >
                    <div>
                        <p class="text-xs text-gray-500 capitalize">
                            {{ formatStatus(status) }}
                        </p>
                        <p class="text-xl font-semibold" :class="{
                        'text-blue-600': status === 'total_sent_count',
                        'text-indigo-600': status === 'total_delivered_count',
                        'text-green-600': status === 'total_read_count',
                        'text-red-600': status === 'total_failed_count',
                      }">
                            {{ count }}
                        </p>
                    </div>

                    <!-- ICON -->
                    <div
                        class="h-10 w-10 rounded-full flex items-center justify-center"
                        :class="iconBg(status)"
                    >
                        <component
                            :is="iconMap(status)"
                            class="h-5 w-5"
                            :class="iconColor(status)"
                        />
                    </div>
                </div>
            </div>


            <!-- Table Component-->
            <CampaignTable :rows="props.rows" :filters="props.filters"/>
        </div>
    </AppLayout>
</template>
<script setup>
    import AppLayout from "./../Layout/App.vue";
    import { Link } from "@inertiajs/vue3";
    import CampaignTable from '@/Components/Tables/CampaignTable.vue';
    import {
        PaperAirplaneIcon,
        CheckIcon,
        CheckCircleIcon,
        XCircleIcon,
        ChatBubbleLeftRightIcon
    } from '@heroicons/vue/24/outline'
    import { usePlan } from '@/Composables/usePlan';
    
    const { getLimit } = usePlan()
    const plan = getLimit('campaign_limit')

    const props = defineProps({ rows: Object, filters: Object, statusSummary: Object, });


    const formatStatus = (status) =>
        status.replace(/_/g, ' ').replace(/\b\w/g, l => l.toUpperCase())

    const iconMap = (status) => {
        switch (status) {
            case 'total_sent_count':
            case 'sent':
                return PaperAirplaneIcon
            case 'total_delivered_count':
            case 'delivered':
                return CheckIcon
            case 'total_read_count':
            case 'read':
                return CheckCircleIcon
            case 'total_failed_count':
            case 'failed':
                return XCircleIcon
            default:
                return ChatBubbleLeftRightIcon
        }
    }

    const iconBg = (status) => {
        return {
            sent: 'bg-blue-100',
            total_sent_count: 'bg-blue-100',

            delivered: 'bg-indigo-100',
            total_delivered_count: 'bg-indigo-100',

            read: 'bg-green-100',
            total_read_count: 'bg-green-100',

            failed: 'bg-red-100',
            total_failed_count: 'bg-red-100',
        }[status] || 'bg-gray-100'
    }

    const iconColor = (status) => {
        return {
            sent: 'text-blue-600',
            total_sent_count: 'text-blue-600',

            delivered: 'text-indigo-600',
            total_delivered_count: 'text-indigo-600',

            read: 'text-green-600',
            total_read_count: 'text-green-600',

            failed: 'text-red-600',
            total_failed_count: 'text-red-600',
        }[status] || 'text-gray-600'
    }


</script>