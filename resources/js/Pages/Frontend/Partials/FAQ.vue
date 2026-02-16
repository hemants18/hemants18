<template>
  <section v-if="props.faqs.data?.length > 0" class="faq_section mt-60 mb-60">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">Frequently Asked Questions</h2>
          <p class="desc">
            Find clear answers to common questions about WhatsApp Business API,
            setup, pricing, features, and how it helps your business grow.
          </p>
        </div>

        <div class="row justify-content-center">
          <div class="col-lg-10">
            <div class="accordion" id="faqAccordion">
              <div
                class="accordion-item"
                v-for="(item, index) in props.faqs.data"
                :key="index"
              >
                <h2 class="accordion-header">
                  <button
                    class="accordion-button d-flex justify-content-between align-items-center"
                    :class="{ active: activeIndex === index }"
                    @click="toggle(index)"
                  >
                    <span v-html="item.question"></span>
                  </button>
                </h2>

                <!-- Animated Content -->
                <transition
                  name="accordion"
                  @enter="enter"
                  @after-enter="afterEnter"
                  @leave="leave"
                >
                  <div v-show="activeIndex === index" class="accordion-body-wrapper">
                    <div class="accordion-body" v-html="item.answer"></div>
                  </div>
                </transition>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
</template>
<script setup>
import { Link } from '@inertiajs/vue3'
import { ref, onMounted } from 'vue';
const props = defineProps(['faqs']);

const activeIndex = ref(0)

const toggle = (index) => {
  activeIndex.value = activeIndex.value === index ? null : index
}

// Animation hooks
const enter = (el) => {
  el.style.height = '0'
  el.style.opacity = '0'
  el.style.transition = 'all 0.35s ease'
  requestAnimationFrame(() => {
    el.style.height = el.scrollHeight + 'px'
    el.style.opacity = '1'
  })
}

const afterEnter = (el) => {
  el.style.height = 'auto'
}

const leave = (el) => {
  el.style.height = el.scrollHeight + 'px'
  el.style.opacity = '1'
  requestAnimationFrame(() => {
    el.style.height = '0'
    el.style.opacity = '0'
  })
}

</script>
<!-- FAQ Section -->
    