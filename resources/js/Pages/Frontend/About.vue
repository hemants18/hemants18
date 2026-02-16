<template>
<!-- Hero Section -->
	<Navbar />
    <section class="page_header_section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-10 text-center">
            <h1 class="page_title">About Us</h1>
            <nav aria-label="breadcrumb">
              <ol class="breadcrumb justify-content-center">
                <li class="breadcrumb-item"><Link href="/">Home</Link></li>
                <li class="breadcrumb-item active" aria-current="page">
                  About Us
                </li>
              </ol>
            </nav>
          </div>
        </div>
      </div>
    </section>
    <!-- About Content Section -->
    <section class="about_content_section mt-60 mb-60">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 mb-5 mb-lg-0">
            <div class="about_image_wrapper">
              <img
                src="@/assets/images/contact0us-img.webp"
                alt="About Wa Biz Boost"
                class="img-fluid rounded-4 shadow-lg"
              />
              <div class="experience_badge">
                <span class="count">10+</span>
                <span class="text">Years of<br />Excellence</span>
              </div>
            </div>
          </div>
          <div class="col-lg-6 ps-lg-5">
            <div class="section_heading text-start mb-3">
              <h2 class="section_title">
                Helping Businesses <span class="highlight">Grow</span> with
                Smart Communication
              </h2>
            </div>
            <p class="lead text-secondary mb-4">
              At Wa Biz Boost, we believe that effective communication is the
              backbone of every successful business. Our mission is to empower
              companies of all sizes to connect with their customers instantly,
              personally, and at scale using the power of WhatsApp.
            </p>
            <p class="text-secondary mb-4">
              Founded with a vision to simplify business messaging, we provide a
              robust platform for WhatsApp Business API solutions. Whether it's
              automating customer support, sending targeted campaigns, or
              integrating with your existing tools, we make it seamless and
              efficient.
            </p>
            <div class="about_features d-grid gap-3">
              <div class="d-flex align-items-center gap-3">
                <div class="icon_box_sm">
                  <i class="fa-solid fa-check"></i>
                </div>
                <h5 class="mb-0">Official Meta Partner</h5>
              </div>
              <div class="d-flex align-items-center gap-3">
                <div class="icon_box_sm">
                  <i class="fa-solid fa-check"></i>
                </div>
                <h5 class="mb-0">24/7 Dedicated Support</h5>
              </div>
              <div class="d-flex align-items-center gap-3">
                <div class="icon_box_sm">
                  <i class="fa-solid fa-check"></i>
                </div>
                <h5 class="mb-0">Enterprise-Grade Security</h5>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Stats Section -->
    <section class="stats_section bg-light pt-50 pb-50">
      <div class="container">
        <div class="row g-3 text-center">
          <div class="col-lg-3 col-6">
            <div class="stat_card">
              <h2 class="stat_number highlight">500+</h2>
              <p class="stat_label">Happy Clients</p>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="stat_card">
              <h2 class="stat_number highlight">10M+</h2>
              <p class="stat_label">Messages Sent</p>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="stat_card">
              <h2 class="stat_number highlight">98%</h2>
              <p class="stat_label">Satisfaction Rate</p>
            </div>
          </div>
          <div class="col-lg-3 col-6">
            <div class="stat_card">
              <h2 class="stat_number highlight">24/7</h2>
              <p class="stat_label">Support Available</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Mission & Vision Section -->
    <section class="mission_vision_section mt-60 mb-60">
      <div class="container">
        <div class="row g-4">
          <div class="col-lg-6">
            <div class="card_box h-100">
              <div class="icon_wrapper mb-4">
                <i class="fa-solid fa-bullseye"></i>
              </div>
              <h3 class="mb-3">Our Mission</h3>
              <p class="text-secondary">
                To revolutionize business communication by providing accessible,
                powerful, and intelligent WhatsApp tools that bridge the gap
                between businesses and their customers creating meaningful
                interactions that drive growth.
              </p>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="card_box h-100">
              <div class="icon_wrapper mb-4">
                <i class="fa-solid fa-lightbulb"></i>
              </div>
              <h3 class="mb-3">Our Vision</h3>
              <p class="text-secondary">
                To be the global leader in conversational commerce, enabling a
                world where businesses can serve, support, and sell to their
                customers as easily as text messaging a friend.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Why Choose Us -->
    <section class="why_choose_section bg-light mt-60 pt-50 pb-50">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">
            Why Choose <span class="highlight">Wa Biz Boost?</span>
          </h2>
          <p class="desc mx-auto">
            It's not just about sending messages; it's about building
            relationships.
          </p>
        </div>
        <div class="row g-4">
          <div class="col-lg-4 col-md-6">
            <div
              class="feature_card text-center p-4 bg-white rounded-4 shadow-sm h-100"
            >
              <div class="feature_icon mb-3 text-primary fs-2">
                <i class="fa-solid fa-rocket"></i>
              </div>
              <h4>Fast & Reliable</h4>
              <p class="text-secondary small">
                High throughput messaging infrastructure ensuring your messages
                land instantly.
              </p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div
              class="feature_card text-center p-4 bg-white rounded-4 shadow-sm h-100"
            >
              <div class="feature_icon mb-3 text-primary fs-2">
                <i class="fa-solid fa-shield-halved"></i>
              </div>
              <h4>Secure & Compliant</h4>
              <p class="text-secondary small">
                Fully GDPR compliant and adhering to all WhatsApp Business
                policies.
              </p>
            </div>
          </div>
          <div class="col-lg-4 col-md-6">
            <div
              class="feature_card text-center p-4 bg-white rounded-4 shadow-sm h-100"
            >
              <div class="feature_icon mb-3 text-primary fs-2">
                <i class="fa-solid fa-chart-pie"></i>
              </div>
              <h4>Advanced Analytics</h4>
              <p class="text-secondary small">
                Deep insights into delivery rates, read receipts, and customer
                engagement.
              </p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- CTA Section -->
    <section class="cta_section pt-50 pb-50 text-white text-center">
      <div class="container">
        <h2 class="mb-2 fw-bold">
          Ready to Transform Your Business Communication?
        </h2>
        <p class="mb-4 lead opacity-75">
          Join successful businesses using Wa Biz Boost today.
        </p>
        <div class="d-flex justify-content-center gap-3">
          <Link href="/#pricing" class="btn btn_white btn_lg"
            >View Pricing</Link
          >
          <Link href="/contact-us" class="btn btn_outline_white btn_lg">Contact Sales</Link>
        </div>
      </div>
    </section>

    <Footer :companyConfig="props.companyConfig" />
</template>	
<script setup>
import { Link } from '@inertiajs/vue3'
import Navbar from './Partials/Navbar.vue'
import Footer from './Partials/Footer.vue'
const props = defineProps(['companyConfig']);
</script>