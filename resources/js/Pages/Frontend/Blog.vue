<template>
<!-- Hero Section -->
	<Navbar />
    <section class="page_header_section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10 text-center">
            <h1 class="page_title">Blogs</h1>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><Link href="/">Home</Link></li>
                <li class="breadcrumb-item active" aria-current="page">
                  Blogs
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>

    <div class="max-w-7xl mx-auto px-4 py-10">

    <h1 class="text-3xl font-bold mb-8">
        Latest Blogs
    </h1>

    <!-- Search Bar -->
    <div class="mb-6 flex justify-between items-center">

        <div class="relative w-full md:w-1/3">
            <input
                v-model="search"
                @input="handleSearch"
                type="text"
                placeholder="blogs by title, category, author..."
                class="w-full border rounded-lg px-4 py-2 pl-10 pr-10 focus:ring-2 focus:ring-blue-500 focus:outline-none"
            />

            <!-- Clear Icon -->
            <span
                v-if="search"
                @click="clearSearch"
                class="absolute right-3 top-2.5 text-gray-400 cursor-pointer hover:text-red-500"
            >
                ✖
            </span>
        </div>

    </div>

    <!-- Blog Grid -->
    <div class="grid md:grid-cols-3 gap-6">

        <div
            v-for="blog in props.blog.data"
            :key="blog.id"
            class="bg-white rounded-lg shadow hover:shadow-xl transition duration-300 group overflow-hidden"
        >

            <!-- Image -->
           <div class="relative overflow-hidden">

                <!-- Category Badge -->
                <span
                    class="absolute top-3 left-3 z-10 bg-green-600 text-white text-xs px-3 py-1 rounded-full shadow"
                >
                    {{ blog.category?.name }}
                </span>

                <!-- Image -->
                <Link :href="blog.slug">
                    <img
                        :src="imageUrl(blog.image)"
                        class="w-full h-48 object-cover transition duration-500 group-hover:scale-110"
                    >
                </Link>

            </div>

            <div class="p-4">

                <div class="flex items-center justify-between mb-2">

                  <!-- Author Badge -->
                  <span
                      class="bg-gray-100 text-gray-700 text-xs px-3 py-1 rounded-full"
                  >
                      👤 {{ blog.author?.full_name }}
                  </span>

                  <!-- Date -->
                  <span class="text-xs text-gray-500">
                      {{ blog.publish_date_formatted }}
                  </span>

              </div>


                <!-- Title -->
                <h2 class="text-lg font-semibold mb-2">
                    {{ limitText(blog.title) }}
                </h2>

                <!-- Tags -->
                <div class="flex flex-wrap gap-1 mb-2">
                    <span
                        v-for="tag in parseTags(blog.tags)"
                        :key="tag"
                        class="text-xs bg-gray-200 px-2 py-1 rounded"
                    >
                        {{ tag }}
                    </span>
                </div>

                <!-- Content Preview -->
                <p class="text-gray-600 text-sm mb-3">
                    {{ stripHtml(blog.content) }}
                </p>

                <!-- Read More -->
                <button
                    class="text-blue-600 font-medium hover:underline"
                    @click="router.visit(`blogs/${blog.slug}`)"
                >
                    Read More →
                </button>

            </div>

        </div>

    </div>


    <!-- Pagination -->
    <div class="flex justify-center mt-10 gap-2">

        <button
            v-for="link in props.blog.links"
            :key="link.label"
            @click="goToPage(link.url)"
            v-html="link.label"
            :disabled="!link.url"
            class="px-4 py-2 border rounded"
            :class="{
                'bg-blue-600 text-white': link.active,
                'bg-gray-200': !link.active
            }"
        />

    </div>

</div>

     <Footer :companyConfig="props.companyConfig" />
</template> 
<script setup>
import { Link } from '@inertiajs/vue3'
import Navbar from './Partials/Navbar.vue'
import Footer from './Partials/Footer.vue'
import { router } from '@inertiajs/vue3'
import { ref, computed } from 'vue'

const props = defineProps(['companyConfig','blog']);
const search = ref(props.blog?.search || '')

/**
 * Debounce timer
 */
let timeout = null

const handleSearch = () => {
    clearTimeout(timeout)

    timeout = setTimeout(() => {
        router.visit('/blogs', {
            method: 'get',
            data: { search: search.value },
            preserveState: true,
            replace: true,
        })
    }, 500) // 500ms debounce
}

const clearSearch = () => {
    search.value = ''
    router.visit('/blogs', {
        method: 'get',
        preserveState: true,
        replace: true,
    })
}

/**
 * Convert tags string → array
 */
const parseTags = (tags) => {
    try {
        return JSON.parse(tags)
    } catch {
        return []
    }
}

/**
 * Get full image URL
 */
const imageUrl = (path) => {
    if (!path) return '/images/default.png'
    return `/media/${path}`
}

/**
 * Strip HTML for preview
 */
const stripHtml = (html) => {
    const div = document.createElement('div')
    div.innerHTML = html
    return div.textContent.substring(0, 120) + '...'
}

/**
 * Strip HTML for preview
 */
const limitText = (text, limit = 60) => {
    if (!text) return ''
    return text.length > limit
        ? text.slice(0, limit) + '...'
        : text
}

/**
 * Pagination
 */
const goToPage = (url) => {
    if (url) router.visit(url)
}
</script>