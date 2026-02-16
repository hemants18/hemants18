<template>
	<!-- Footer -->
    <footer class="footer_section pt-50 mt-0">
      <div class="container">
        <!-- Newsletter -->
        <div class="newsletter_wrapper text-center pb-50">
          <h2 class="section_title text-white">Sign Up For Newsletter</h2>
          <p class="desc">
            Stay updated with the latest WhatsApp features, product updates,
            automation tips, and best practices to grow your business
            communication.
          </p>
          <form class="newsletter_form mx-auto">
            <input
              type="email"
              class="form-control"
              placeholder="Enter Your Email"
            />
            <button type="submit" class="btn">
              <i class="fa-regular fa-paper-plane"></i>
            </button>
          </form>
        </div>
      </div>

      <div class="footer_border"></div>

      <div class="container">
        <!-- Footer Links -->
        <div class="row pt-50 pb-50">
          <!-- Col 1: Logo & Social -->
          <div class="col-lg-3 mb-4 mb-lg-0">
            <Link href="./" class="footer_logo_wrapper">
              <img
                src="@/assets/images/wabizboost-logo.png"
                alt="Wabizboost"
                class="img-fluid footer_logo"
              />
            </Link>
            <p class="text-white-50 mb-4">
              Empowering businesses to scale customer relationships on WhatsApp
              with enterprise-grade tools, automation, and verified support.
            </p>
            <div class="social_icons d-flex gap-3">
              <a v-if="facebookUrl" :href="facebookUrl"><i class="fa-brands fa-facebook-f"></i></a>
              <a v-if="twitterUrl" :href="twitterUrl"><i class="fa-brands fa-x-twitter"></i></a>
              <a v-if="linkedinUrl" :href="linkedinUrl"><i class="fa-brands fa-linkedin-in"></i></a>
              <a v-if="instagramUrl" :href="instagramUrl"><i class="fa-brands fa-instagram"></i></a>
              <a v-if="slackUrl" :href="slackUrl"><i class="fa-brands fa-youtube"></i></a>
            </div>
          </div>

          <!-- Col 2: Solutions -->
          <div class="col-lg-2 col-6 mb-4 mb-lg-0">
            <h4 class="footer_heading text-white mb-3">Solutions</h4>
            <ul class="footer_links list-unstyled">
              <li><Link href="#">Education</Link></li>
              <li><Link href="#">Real Estate</Link></li>
              <li><Link href="#">Travel</Link></li>
              <li><Link href="#">Health Care</Link></li>
              <li><Link href="#">Finance</Link></li>
              <li><Link href="#">Sales</Link></li>
              <li><Link href="#">Marketing</Link></li>
              <li><Link href="#">Customer Support</Link></li>
            </ul>
          </div>

          <!-- Col 3: Product -->
          <div class="col-lg-2 col-6 mb-4 mb-lg-0">
            <h4 class="footer_heading text-white mb-3">Product</h4>
            <ul class="footer_links list-unstyled">
              <li><Link href="/#features">Feature</Link></li>
              <li><Link href="/#pricing">Pricing</Link></li>
            </ul>
          </div>

          <!-- Col 4: Resource -->
          <div class="col-lg-2 col-6 mb-4 mb-lg-0">
            <h4 class="footer_heading text-white mb-3">Resource</h4>
            <ul class="footer_links list-unstyled">
              <li><Link href="/contact-us">Help Desk</Link></li>
              <li><Link href="#">Blog</Link></li>
              <li><Link href="#">Templates</Link></li>
            </ul>
          </div>

          <!-- Col 5: Company -->
          <div class="col-lg-3 col-6">
            <h4 class="footer_heading text-white mb-3">Company</h4>
            <ul class="footer_links list-unstyled">
              <li><Link href="/about-us">About Us</Link></li>
              <!-- <li><Link href="#">Career</Link></li> -->
              <li><Link href="/contact-us">Contact Us</Link></li>
              <li><Link href="/privacy-policy">Privacy Policy</Link></li>
              <li><Link href="/refund-policy">Refund Policy</Link></li>
              <li>
                <Link href="/terms-of-service">Terms & Conditions</Link>
              </li>
            </ul>
          </div>
        </div>
      </div>

      <div class="footer_border"></div>

      <div class="container">
        <!-- Copyright -->
        <div class="copyright_text row align-items-center text-white-50">
          <div class="col-md-6 text-center text-md-start">
            <p class="mb-0">© {{currentYear}} Wabizboost. All Rights Reserved.</p>
          </div>
          <div class="col-md-6 text-center text-md-end">
            <p class="mb-0">
              Design and Develop by
              <a href="https://www.dqotsolutions.com/" target="_blank"
                >dqotsolutions</a
              >
            </p>
          </div>
        </div>
      </div>
    </footer>
</template>
<script setup>
import { Link } from '@inertiajs/vue3'
import { ref, onMounted } from 'vue';
const props = defineProps(['companyConfig','pages']);


const currentYear = new Date().getFullYear();
const facebookUrl = ref(null);
const twitterUrl = ref(null);
const instagramUrl = ref(null);
const slackUrl = ref(null);
const linkedinUrl = ref(null);

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