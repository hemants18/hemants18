<template>

  <Head>
      <meta name="description" :content="cleanDescription"/>
      <meta name="keywords" :content="blog.meta_keywords || parsedTags.join(', ')"/>
      <!-- Open Graph -->
      <meta property="og:title" :content="blog.meta_title || blog.title" />
      <meta property="og:description" :content="cleanDescription" />
      <meta property="og:image" :content="imageUrl(blog.image)" />
      <meta property="og:type" content="article" />
  </Head>

<!-- Hero Section -->
	<Navbar />
    <section class="page_header_section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10 text-center">
            <h1 class="page_title" v-html="props.blog?.title"></h1>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><Link href="/">Home</Link></li>
                <li class="breadcrumb-item"><Link href="/blogs">Blog</Link></li>
                <li class="breadcrumb-item active" aria-current="page" v-html="props.blog?.title"></li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>

    

     <Footer :companyConfig="props.companyConfig" />
</template> 
<script setup>
import { Link } from '@inertiajs/vue3'
import Navbar from './Partials/Navbar.vue'
import Footer from './Partials/Footer.vue'
import { router } from '@inertiajs/vue3'
import { computed } from 'vue'
import { Head } from '@inertiajs/vue3'

const props = defineProps(['companyConfig','blog']);
const blog = props.blog

const parsedTags = computed(() => {
    try {
        return JSON.parse(blog.tags || '[]')
    } catch {
        return []
    }
})

const imageUrl = (path) => {
    if (!path) return '/images/default.png'
    return `/media/${path}`
}

const cleanDescription = computed(() => {
    if (blog.meta_description) {
        return blog.meta_description
    }

    const text = stripHtml(blog.content)
    return text.length > 160
        ? text.substring(0, 160) + '...'
        : text
})

const stripHtml = (html) => {
    if (!html) return ''

    const div = document.createElement('div')
    div.innerHTML = html
    return (div.textContent || div.innerText || '').replace(/\s+/g, ' ').trim()
}

</script>