<template>
    <aside class="md:flex flex-col w-[30%] h-full bg-white border-r border-l hidden">
        <div class="flex-grow space-y-3 px-2 overflow-y-auto">
            <div class="flex-1">
                <h2 class="px-4 pt-10 text-xl">{{ $t('Blog') }}</h2>
                <ul class="pt-5 pb-4 space-y-1 text-sm text-gray-700">
                    <li class="hover:bg-primary hover:text-white rounded-[5px] px-2 truncate" :class="$page.url.startsWith('/admin/blog/posts') ? 'bg-primary text-white' : ''">
                        <Link rel="noopener noreferrer" href="/admin/blog/posts" class="flex items-center p-2 space-x-3 rounded-md">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"><path d="m13.6 21.076l5.46-3.152c.584-.337.875-.505 1.087-.74a2 2 0 0 0 .416-.72c.097-.301.097-.637.097-1.307V8.843c0-.67 0-1.006-.098-1.307a2 2 0 0 0-.416-.72c-.21-.234-.5-.402-1.079-.736L13.6 2.924c-.583-.337-.874-.505-1.184-.57a2 2 0 0 0-.832 0c-.31.065-.601.233-1.184.57L4.938 6.077c-.582.336-.873.504-1.084.739a2 2 0 0 0-.416.72c-.098.302-.098.638-.098 1.311v6.305c0 .673 0 1.01.098 1.311a2 2 0 0 0 .416.72c.211.236.503.404 1.085.74l5.46 3.153c.584.337.875.505 1.185.57c.274.059.558.059.832 0c.31-.065.602-.233 1.185-.57Z"/><path d="M9 12a3 3 0 1 0 6 0a3 3 0 0 0-6 0Z"/></g></svg>
                            <span>{{ $t('Blog') }}</span>
                        </Link>
                    </li>
                    <li class="hover:bg-primary hover:text-white rounded-[5px] px-2 truncate" :class="$page.url.startsWith('/admin/blog/categories') ? 'bg-primary text-white' : ''">
                        <Link rel="noopener noreferrer" href="/admin/blog/categories" class="flex items-center p-2 space-x-3 rounded-md">
                           <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><g fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2"> <path  d="M18 8.5V8.35417C18 6.50171 16.4983 5 14.6458 5H9.5C7.567 5 6 6.567 6 8.5C6 10.433 7.567 12 9.5 12H14.5C16.433 12 18 13.567 18 15.5C18 17.433 16.433 19 14.5 19H9.42708C7.53436 19 6 17.4656 6 15.5729V15.5M12 3V21"></path> </g></svg>
                            <span>{{ $t('Blog Category') }}</span>
                        </Link>
                    </li>
                    <li class="hover:bg-primary hover:text-white rounded-[5px] px-2 truncate" :class="$page.url.startsWith('/admin/blog/authors') ? 'bg-primary text-white' : ''">
                        <Link rel="noopener noreferrer" href="/admin/blog/authors" class="flex items-center p-2 space-x-3 rounded-md">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 13V9m9-3l-2-2m-9-2h4m-2 19a8 8 0 1 1 0-16a8 8 0 0 1 0 16Z"/></svg>
                            <span>{{ $t('Blog Author') }}</span>
                        </Link>
                    </li>
                    <li class="hover:bg-primary hover:text-white rounded-[5px] px-2 truncate" :class="$page.url.startsWith('/admin/blog/tags') ? 'bg-primary text-white' : ''">
                        <Link rel="noopener noreferrer" href="/admin/blog/tags" class="flex items-center p-2 space-x-3 rounded-md">
                            <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 13V9m9-3l-2-2m-9-2h4m-2 19a8 8 0 1 1 0-16a8 8 0 0 1 0 16Z"/></svg>
                            <span>{{ $t('Blog Tags') }}</span>
                        </Link>
                    </li>
                </ul>
            </div>
        </div>
    </aside>
</template>
<script setup>
    import { Link } from "@inertiajs/vue3";
    import { ref } from "vue";

    const showDropdown1 = ref(false);
    const toggleDropdown = (type) => {
        if(type === 'dropdown1'){
            showDropdown1.value = !showDropdown1.value;
        }
    }
</script>