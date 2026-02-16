<template>
	<Navbar />

  <section class="page_header_section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10 text-center">
            <h1 class="page_title">{{ props.page.data.name }}</h1>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><a href="/">Home</a></li>
                <li class="breadcrumb-item active" aria-current="page">
                  {{ props.page.data.name }}
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>

    <section class="cms_content_section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10">
            <div class="cms_content">
              <p class="last_updated">Last Updated: {{ props.page.data.updated_at }}</p>

              <div v-html="props.page.data.content"></div>
            </div>
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
const props = defineProps(['companyConfig', 'page']);
</script>