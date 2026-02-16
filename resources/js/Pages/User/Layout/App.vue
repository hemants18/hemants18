<template>
    <MobileSidebar :user="user" :config="config" :organization="organization" :organizations="organizations" :title="currentPageTitle" :displayCreateBtn="displayCreateBtn" :displayTopBar="viewTopBar"></MobileSidebar>

    <div class="md:mt-0 md:pt-0 flex md:h-screen w-full tracking-[0.3px] bg-gray-300/10" :class="viewTopBar === false ? 'mt-0 pt-0' : ''">
        <Sidebar :user="user" :config="config" :organization="organization" :organizations="organizations" :unreadMessages="unreadMessages"></Sidebar>
        <div class="md:min-h-screen flex flex-col w-full min-w-0">
            <slot :user="user" :subscription="subscription" :toggleNavBar="toggleTopBar" @testEmit="doSomething"></slot>
        </div>
    </div>
</template>
<script setup>
    import { usePage } from "@inertiajs/vue3";
    import axios from 'axios';
    import Sidebar from "./Sidebar.vue";
    import { /*onMounted, onBeforeUnmount,*/ defineProps, ref, computed, watch , provide} from 'vue';
    import { toast } from 'vue3-toastify';
    import MobileSidebar from "./MobileSidebar.vue";
    import 'vue3-toastify/dist/index.css';
    // import { getEchoInstance } from '@/echo'

    const viewTopBar = ref(true);
    const user = computed(() => usePage().props.auth.user);
    const config = computed(() => usePage().props.config);
    const organization = computed(() => usePage().props.organization);
    const organizations = computed(() => usePage().props.organizations);
    const currentPageTitle = computed(() => usePage().props.title);
    const displayCreateBtn = computed(() => usePage().props.allowCreate);
    const unreadMessages = ref(usePage().props.unreadMessages);

    watch(() => [usePage().props.flash, { deep: true }], () => {
        if(usePage().props.flash.status != null){
            toast(usePage().props.flash.status.message, {
                autoClose: 3000,
            });
        }
    });

    const toggleTopBar = () => {
        viewTopBar.value = !viewTopBar.value;
    };

    const doSomething = () => {
        alert('test');
    };

    // const onlineAgents = ref([])

    // onMounted(() => {
    //     const echo = getEchoInstance()
    //     echo.join(`agents.${organization.value.id}`)
    //         .here(users => {
    //             onlineAgents.value = users
    //             syncOnline(users)
    //         })
    //         .joining(user => {
    //             markOnline(user)
    //         })
    //         .leaving(user => {
    //             markOffline(user)
    //         })
    // })

    // onBeforeUnmount(() => {
    //     const echo = getEchoInstance()
    //     echo.leave(`agents.${organization.value.id}`)
    // })

    // function syncOnline(users) {
    //     users.forEach(user => markOnline(user))
    // }

    // function markOnline(user) {
    //     axios.post('/team/update-status', {
    //         user_id: user.id,
    //         status : 'online',
    //     })
    // }

    // function markOffline(user) {
    //     axios.post('/team/update-status', {
    //         user_id: user.id,
    //         status : 'offline',
    //     })
    // }



</script>