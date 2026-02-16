import { computed } from 'vue'
import { usePage } from '@inertiajs/vue3'

export function usePlan() {
    const page = usePage()

    const subscription = computed(() => page.props.subscription)
    const teamMembers = computed(() => page.props.rows?.data ?? [])
    const customers = computed(() => page.props.rows?.data ?? [])
    const chat = computed(() => page.props.rows?.data ?? [])
    const campaigns = computed(() => page.props.rows?.data ?? [])
    const canned = computed(() => page.props.rows?.data ?? [])

    
    const planMetadata = computed(() => {
        if (!subscription.value?.plan?.metadata) return {}
        try {
            return JSON.parse(subscription.value.plan.metadata)
        } catch {
            return {}
        }
    })

    const usedMap = {
        team_limit: () =>
            teamMembers.value.filter(m => m.role !== 'owner').length,

        contacts_limit: () =>
            customers.value.length,

        message_limit: () =>
            chat.value.length,

        campaign_limit: () =>
            campaigns.value.filter(m => m.status == 'completed').length,

        canned_replies_limit: () =>
            canned.value.length
    }

    const getLimit = (key) => {
        const limit = planMetadata.value[key]

        if (limit === undefined) {
            return {
                total: 0,
                used: 0,
                remaining: 0,
                isUnlimited: false,
                label: '0 / 0'
            }
        }

        const total =
            limit === '-1' || limit === -1
                ? 'Unlimited'
                : Number(limit)

        const used =
            typeof usedMap[key] === 'function'
                ? usedMap[key]()
                : 0

        const remaining =
            total === 'Unlimited'
                ? 'Unlimited'
                : Math.max(total - used, 0)

        return {
            total,
            used,
            remaining,
            isUnlimited: total === 'Unlimited',
            label:
                total === 'Unlimited'
                    ? `${used} / Unlimited`
                    : `${used} / ${total} (${remaining} remaining)`
        }
    }

    return {
        planMetadata,
        getLimit
    }
}
