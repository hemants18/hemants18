<template>
	<!-- Header -->
	<Navbar />
    <section class="page_header_section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10 text-center">
            <h1 class="page_title">Contact Us</h1>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><Link href="/">Home</Link></li>
                <li class="breadcrumb-item active" aria-current="page">
                  Contact Us
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact Wrapper Section -->
    <section class="contact_wrapper_section">
      <div class="container">
        <div class="contact_card">
          <div class="row g-0">
            <!-- Contact Info Side -->
            <div class="col-lg-5 p-0">
              <div class="contact_info_side h-100">
                <h3 class="fw-bold">Contact Information</h3>
                <p class="mb-5 opacity-75">
                  Fill up the form and our Team will get back to you within 24
                  hours.
                </p>

                <div class="contact_details">
                  <div class="contact_item d-flex gap-3 mb-4">
                    <div class="icon_box">
                      <i class="fa-solid fa-phone"></i>
                    </div>
                    <div>
                      <h6 class="mb-1 fw-bold">Call Us</h6>
                      <a
                        href="tel:+919876543210"
                        class="text-white text-decoration-none opacity-75"
                        >+91 98765 43210</a
                      >
                    </div>
                  </div>

                  <div class="contact_item d-flex gap-3 mb-4">
                    <div class="icon_box">
                      <i class="fa-solid fa-envelope"></i>
                    </div>
                    <div>
                      <h6 class="mb-1 fw-bold">Email Us</h6>
                      <a
                        href="mailto:support@wabizboost.com"
                        class="text-white text-decoration-none opacity-75"
                        >support@wabizboost.com</a
                      >
                    </div>
                  </div>

                  <div class="contact_item d-flex gap-3 mb-4">
                    <div class="icon_box">
                      <i class="fa-solid fa-location-dot"></i>
                    </div>
                    <div>
                      <h6 class="mb-1 fw-bold">Visit Us</h6>
                      <p class="mb-0 opacity-75">
                        123 Business Park, Tech City,<br />New Delhi, India
                        110001
                      </p>
                    </div>
                  </div>
                </div>

                <div class="social_connect mt-auto pt-5">
                  <div class="d-flex gap-3">
                    <!-- <a href="#" class="social_btn"
                      ><i class="fa-brands fa-facebook-f"></i
                    ></a>
                    <a href="#" class="social_btn"
                      ><i class="fa-brands fa-twitter"></i
                    ></a>
                    <a href="#" class="social_btn"
                      ><i class="fa-brands fa-instagram"></i
                    ></a>
                    <a href="#" class="social_btn"
                      ><i class="fa-brands fa-linkedin-in"></i
                    ></a> -->

                    <a class="social_btn" v-if="facebookUrl" :href="facebookUrl"><i class="fa-brands fa-facebook-f"></i></a>
                    <a class="social_btn" v-if="twitterUrl" :href="twitterUrl"><i class="fa-brands fa-x-twitter"></i></a>
                    <a class="social_btn" v-if="linkedinUrl" :href="linkedinUrl"><i class="fa-brands fa-linkedin-in"></i></a>
                    <a class="social_btn" v-if="instagramUrl" :href="instagramUrl"><i class="fa-brands fa-instagram"></i></a>
                    <a class="social_btn" v-if="slackUrl" :href="slackUrl"><i class="fa-brands fa-youtube"></i></a>

                  </div>
                </div>

                <!-- Decorative Circles -->
                <div class="circle_one"></div>
                <div class="circle_two"></div>
              </div>
            </div>

            <!-- Contact Form Side -->
            <div class="col-lg-7 p-0">
              <div class="contact_form_side bg-white h-100">
                <form @submit.prevent="submit">
                  <div class="row g-4">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="form-label text-secondary fw-600"
                          >First Name</label
                        >
                        <input
                          v-model="form.name"
                          type="text"
                          class="form-control"
                          :class="{ 'is-invalid': form.errors.name }"
                          placeholder="Enter your full First Name"
                        />
                        <div class="invalid-feedback">{{ form.errors.name }}</div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label text-secondary fw-600"
                          >Email Address</label
                        >
                        <input
                            v-model="form.email"
                            type="email"
                            class="form-control"
                            :class="{ 'is-invalid': form.errors.email }"
                            placeholder="Enter your email"
                          />
                          <div class="invalid-feedback">{{ form.errors.email }}</div>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="form-group">
                        <label class="form-label text-secondary fw-600"
                          >Phone Number</label
                        >
                        <input
                            v-model="form.phone"
                            type="text"
                            class="form-control"
                            :class="{ 'is-invalid': form.errors.phone }"
                            placeholder="919898989898"
                          />
                          <div class="invalid-feedback">{{ form.errors.phone }}</div>
                      </div>
                    </div>
                    <div class="col-12">
                      <div class="form-group">
                        <label class="form-label text-secondary fw-600">
                          Subject
                        </label>

                        <div class="radio_group d-flex flex-wrap gap-3 mt-2">
                          <div class="form-check">
                            <input
                              class="form-check-input"
                              type="radio"
                              id="inquiry1"
                              value="General Inquiry"
                              v-model="form.use_case"
                            />
                            <label class="form-check-label" for="inquiry1">
                              General Inquiry
                            </label>
                          </div>

                          <div class="form-check">
                            <input
                              class="form-check-input"
                              type="radio"
                              id="inquiry2"
                              value="Support"
                              v-model="form.use_case"
                            />
                            <label class="form-check-label" for="inquiry2">
                              Support
                            </label>
                          </div>

                          <div class="form-check">
                            <input
                              class="form-check-input"
                              type="radio"
                              id="inquiry3"
                              value="Sales"
                              v-model="form.use_case"
                            />
                            <label class="form-check-label" for="inquiry3">
                              Sales
                            </label>
                          </div>
                        </div>

                        <!-- Validation Error -->
                        <div v-if="form.errors.use_case" class="text-danger small mt-1">
                          {{ form.errors.use_case }}
                        </div>
                      </div>
                    </div>

                    <div class="col-12">
                      <div class="form-group">
                        <label class="form-label text-secondary fw-600"
                          >Message</label
                        >
                        <textarea
                          v-model="form.message"
                          class="form-control"
                          :class="{ 'is-invalid': form.errors.message }"
                          placeholder="Tell us about your requirements..."
                          rows="4"
                        ></textarea>
                        <div class="invalid-feedback">{{ form.errors.message }}</div>
                      </div>
                    </div>
                    <div class="col-12 text-end">

                      <button
                        type="submit"
                        class="btn btn_global btn_primary px-5"
                        :disabled="form.processing"
                      >
                        {{ form.processing ? 'Send...' : 'Send Message' }}
                      </button>

                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ Section -->
    <FAQ :faqs="props.faqs" />

<Footer :companyConfig="props.companyConfig" />

</template>	
    <script setup>
import { ref, onMounted, watch } from 'vue'
import { Link, useForm, usePage } from '@inertiajs/vue3'
import Navbar from './Partials/Navbar.vue'
import Footer from './Partials/Footer.vue'
import FAQ from './Partials/FAQ.vue'
import { toast } from 'vue3-toastify';

const props = defineProps(['companyConfig', 'faqs']);


const currentYear = new Date().getFullYear();
const facebookUrl = ref(null);
const twitterUrl = ref(null);
const instagramUrl = ref(null);
const slackUrl = ref(null);
const linkedinUrl = ref(null);

const form = useForm({
  name: '',
  email: '',
  phone: '',
  use_case: 'General Inquiry', // ✅ default selected
  type: 'CONTACT-US', // ✅ default selected
  message: '',
})


const submit = () => {
  form.post('client-demo', {
    preserveScroll: true,
    onSuccess: () => {
      form.reset()
    },
  })
}

watch(() => [usePage().props.flash, { deep: true }], () => {
      if(usePage().props.flash.status != null){
          toast(usePage().props.flash.status.message, {
              autoClose: 3000,
          });
      }
  });

const parseSocials = () => {
    try {

        const socialsArray = JSON.parse(props.companyConfig.socials);

        facebookUrl.value = socialsArray['facebook'] || null;
        twitterUrl.value = socialsArray['twitter'] || null;
        instagramUrl.value = socialsArray['instagram'] || null;
        slackUrl.value = socialsArray['slack'] || null;
        linkedinUrl.value = socialsArray['linkedin'] || null;
    } catch (error) {
        console.error('Error parsing socials:', error);
    }
};
onMounted(() => {
    parseSocials();
});
</script>