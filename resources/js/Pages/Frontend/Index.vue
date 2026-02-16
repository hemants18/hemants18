<template>
    <!-- Navbar -->
    <Navbar />
    <!-- Hero Section -->
    <!-- Hero Section -->
    <section class="hero_section">
      <div class="container">
        <div class="hero_content_wrapper text-center">
          <div class="hero_badge">India's Smartest Way to Sell on WhatsApp</div>
          <h1 class="hero_title">
            Multiply Your Sales Using
            <span class="highlight">WhatsApp Automation</span>
          </h1>
          <p class="hero_desc">
            Use the Official WhatsApp API and never get banned for sending bulk
            messages. wabizboost offers the lowest cost 🤑 with 0% markup fees
            on Meta API, unlike others who add 20-25%.
          </p>
          <div class="hero_btns">
            <a href="/signup" class="btn btn_global btn_primary">Start Free Trial</a>
            <Link href="contact-us" class="btn btn_global btn_outline">Book A Demo</Link>
          </div>
        </div>
        <div class="hero_image_container">
          <img
            src="@/assets/images/hero-img.webp"
            alt="WhatsApp Automation Dashboard"
            class="img-fluid dashboard_img"
          />
          <!-- <video
            src="assets/images/hero-video.mp4"
            autoplay
            muted
            loop
            class="img-fluid dashboard_img"
          >
            <source src="assets/images/hero-video.mp4" type="video/mp4" />
            Your browser does not support the video tag.
          </video> -->
        </div>
      </div>
    </section>

    <!-- Trusted By Brand Section -->
    <section class="trusted_by_section mt-60 mb-60">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">
            Trusted by 500+ Innovative <span class="highlight">Businesses</span>
          </h2>
          <p class="desc">Powering 150,000+ Businesses in 60+ Countries</p>
        </div>

        <div class="swiper trusted_brands_slider">
          <div class="swiper-wrapper">
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-1.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-2.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-3.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-4.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-5.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-3.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
            <div class="swiper-slide">
              <img
                src="@/assets/images/trusted-img-2.webp"
                alt="Brand Logo"
                class="img-fluid brand_logo"
              />
            </div>
          </div>
          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>

    <Pricing :plans="plans" :config="config" :currency="currency"/>

    <!-- !-- Feature 1 -->
    <section class="feature_row_section mt-60" id="features">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">
            Powerful <span class="highlight">Features</span>
          </h2>
          <p class="desc">
            Everything you need to send secure, fast, and verified WhatsApp
            messages—designed to scale, automate, and grow your business
            effortlessly.
          </p>
        </div>
        <div class="row align-items-center">
          <div class="col-lg-6 order-2 order-lg-1">
            <div class="feature_content">
              <h3>
                Free <span class="highlight">WhatsApp Business API</span> Setup
              </h3>
              <p>
                Get instant access to official WhatsApp Business APIs with a
                smooth and cost-free setup process. We handle everything so you
                can start messaging without technical hassle.
              </p>
              <ul class="feature_list">
                <li>
                  <i class="fa-solid fa-circle-check"></i> Free and hassle-free
                  API setup
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Fast account approval
                  and activation
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> 100% policy-compliant
                  integration
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-6 order-1 order-lg-2 mb-4 mb-lg-0">
            <div class="feature_image_container">
              <img
                src="@/assets/images/feature-img-1.webp"
                alt="WhatsApp Business API Setup"
                class="img-fluid"
              />
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Feature 2: Left Image (Even - Light) -->
    <section class="feature_row_section bg_light_secondary mt-50 mb-50 pt-50 pb-50">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 mb-4 mb-lg-0">
            <div class="feature_image_container">
              <img
                src="@/assets/images/feature-img-2.webp"
                alt="Broadcast & Campaigns"
                class="img-fluid"
              />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="feature_content ms-lg-4">
              <h3>
                Smart <span class="highlight">Broadcast & Campaigns</span>
              </h3>
              <p>
                Launch high-impact WhatsApp campaigns and reach thousands of
                users with just a few clicks. Designed to deliver messages that
                get opened and read.
              </p>
              <ul class="feature_list">
                <li>
                  <i class="fa-solid fa-circle-check"></i> Send bulk messages at
                  scale instantly
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Segment audiences for
                  targeted campaigns
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Maximize reach,
                  engagement, and conversions
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Feature 3: Right Image (Odd - White) -->
    <section class="feature_row_section">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 order-2 order-lg-1">
            <div class="feature_content">
              <h3>Campaign <span class="highlight">Retargeting</span></h3>
              <p>
                Reconnect with users who didn't respond or convert earlier and
                turn missed opportunities into sales through smart follow-ups.
              </p>
              <ul class="feature_list">
                <li>
                  <i class="fa-solid fa-circle-check"></i> Retarget inactive or
                  past customers
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Personalized messages
                  based on behavior
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Increase conversion
                  rates and ROI
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-6 order-1 order-lg-2 mb-4 mb-lg-0">
            <div class="feature_image_container">
              <img
                src="@/assets/images/feature-img-3.webp"
                alt="Campaign Retargeting"
                class="img-fluid"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Feature 4: Left Image (Even - Light) -->
    <section class="feature_row_section bg_light_secondary mt-50 mb-50 pt-50 pb-50">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 mb-4 mb-lg-0">
            <div class="feature_image_container">
              <img
                src="@/assets/images/feature-img-4.webp"
                alt="Automation & Chatbots"
                class="img-fluid"
              />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="feature_content ms-lg-4">
              <h3>Automation & <span class="highlight">Chatbots</span></h3>
              <p>
                Automate customer conversations and deliver instant responses
                around the clock with intelligent WhatsApp chatbots.
              </p>
              <ul class="feature_list">
                <li>
                  <i class="fa-solid fa-circle-check"></i> 24/7 automated
                  replies and workflows
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Intelligent query
                  handling and routing
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Seamless human
                  handover when needed
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Feature 5: Right Image (Odd - White) -->
    <section class="feature_row_section">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 order-2 order-lg-1">
            <div class="feature_content">
              <h3>
                <span class="highlight">Team Inbox </span> & Collaboration
              </h3>
              <p>
                Manage all customer conversations efficiently from a shared team
                inbox built for collaboration and speed.
              </p>
              <ul class="feature_list">
                <li>
                  <i class="fa-solid fa-circle-check"></i> Multi-agent access
                  with role control
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Assign, track, and
                  resolve chats easily
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i>Improve response time
                  and team productivity
                </li>
              </ul>
            </div>
          </div>
          <div class="col-lg-6 order-1 order-lg-2 mb-4 mb-lg-0">
            <div class="feature_image_container">
              <img
                src="@/assets/images/feature-img-5.webp"
                alt="Team Inbox & Collaboration"
                class="img-fluid"
              />
            </div>
          </div>
        </div>
      </div>
    </section>
    <!-- Feature 6: Left Image (Even - Light) -->
    <section class="feature_row_section bg_light_secondary mt-50 pt-50 pb-50">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-6 mb-4 mb-lg-0">
            <div class="feature_image_container">
              <img
                src="@/assets/images/feature-img-6.webp"
                alt="Contact & Template Management"
                class="img-fluid"
              />
            </div>
          </div>
          <div class="col-lg-6">
            <div class="feature_content ms-lg-4">
              <h3>
                <span class="highlight">Contact & Template</span> Management
              </h3>
              <p>
                Organize contacts and manage WhatsApp-approved message templates
                effortlessly from one centralized dashboard.
              </p>
              <ul class="feature_list">
                <li>
                  <i class="fa-solid fa-circle-check"></i> Tag and segment
                  contacts smartly
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Create, edit, and
                  reuse templates
                </li>
                <li>
                  <i class="fa-solid fa-circle-check"></i> Streamline campaign
                  and notification workflows
                </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Auth / Get Started Section -->
    <section class="auth_section pt-50 pb-50">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-xl-10">
            <div class="auth_card">
              <!-- Sidebar -->
              <div class="auth_sidebar">
                <div class="sidebar_content">
                  <h3>Get Started Today</h3>
                  <ul class="feature_points">
                    <li>
                      <i class="fa-solid fa-laptop-code"></i>
                      <div class="text">
                        <h5>1-on-1 Guided Demo</h5>
                        <p>Personal walkthrough for your business</p>
                      </div>
                    </li>
                    <li>
                      <i class="fa-solid fa-language"></i>
                      <div class="text">
                        <h5>Bilingual Support</h5>
                        <p>English & Hindi Assistance</p>
                      </div>
                    </li>
                  </ul>
                </div>
                <div class="sidebar_image">
                  <img
                    src="@/assets/images/contact0us-img.webp"
                    alt="Happy Team"
                    class="img-fluid"
                  />
                </div>
              </div>

              <!-- Form Area -->
              <div class="auth_form_container">
                <!--<ul class="nav nav-pills" id="authTab" role="tablist">
                   <li class="nav-item" role="presentation">
                    <button
                      class="nav-link active"
                      id="free-trial-tab"
                      data-bs-toggle="pill"
                      data-bs-target="#free-trial"
                      type="button"
                      role="tab"
                      aria-controls="free-trial"
                      aria-selected="true"
                    >
                      Start Free Trial
                    </button>
                  </li>  <li class="nav-item" role="presentation">
                    <button
                      class="nav-link active"
                      id="book-demo-tab"
                      data-bs-toggle="pill"
                      data-bs-target="#book-demo"
                      type="button"
                      role="tab"
                      aria-controls="book-demo"
                      aria-selected="false"
                    >
                      Book Demo
                    </button>
                  </li>   <li class="nav-item" role="presentation">
                    <button
                      class="nav-link"
                      id="login-tab"
                      data-bs-toggle="pill"
                      data-bs-target="#login"
                      type="button"
                      role="tab"
                      aria-controls="login"
                      aria-selected="false"
                    >
                      Login
                    </button>
                  </li> 
                </ul>-->

                <div class="tab-content" id="authTabContent">
                  <!-- Free Trial Tab -->
                  <!-- <div
                    class="tab-pane fade show active"
                    id="free-trial"
                    role="tabpanel"
                    aria-labelledby="free-trial-tab"
                  >
                    <form>
                      <div class="row g-3">
                        <div class="col-md-6">
                          <label class="form-label">Full Name</label>
                          <input
                            type="text"
                            class="form-control"
                            placeholder="Full Name"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Organization Name</label>
                          <input
                            type="text"
                            class="form-control"
                            placeholder="Organization Name"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Email Address</label>
                          <input
                            type="email"
                            class="form-control"
                            placeholder="Email Address"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Mobile Number</label>
                          <input
                            type="number"
                            class="form-control"
                            placeholder="Mobile Number"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Password</label>
                          <input
                            type="password"
                            class="form-control"
                            placeholder="Password"
                          />
                        </div>
                        <div class="col-md-6">
                          <label class="form-label">Confirm Password</label>
                          <input
                            type="password"
                            class="form-control"
                            placeholder="Confirm Password"
                          />
                        </div>
                      </div>
                      <button
                        type="submit"
                        class="btn btn_global btn_primary w-100"
                      >
                        Sign Up (7 Days Free)
                      </button>
                      <div class="divider_text">OR</div>
                      <div class="social_btn_wrapper">
                        <a href="#" class="social_btn facebook">
                          <i class="fa-brands fa-facebook-f"></i> Sign in with
                          Facebook
                        </a>
                      </div>
                    </form>
                  </div> -->

                  <!-- Book Demo Tab -->
                  <div
                    class="tab-pane fade show active"
                    id="book-demo"
                    role="tabpanel"
                    aria-labelledby="book-demo-tab"
                  >
                    
                    <form @submit.prevent="submit">
                      <div class="mb-3">
                        <label class="form-label">Full Name</label>
                        <input
                          v-model="form.name"
                          type="text"
                          class="form-control"
                          :class="{ 'is-invalid': form.errors.name }"
                          placeholder="Enter your full name"
                        />
                        <div class="invalid-feedback">{{ form.errors.name }}</div>
                      </div>

                      <div class="row g-3 mb-3">
                        <div class="col-md-6">
                          <label class="form-label">Email</label>
                          <input
                            v-model="form.email"
                            type="email"
                            class="form-control"
                            :class="{ 'is-invalid': form.errors.email }"
                            placeholder="Enter your email"
                          />
                          <div class="invalid-feedback">{{ form.errors.email }}</div>
                        </div>

                        <div class="col-md-6">
                          <label class="form-label">Number</label>
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

                      <div class="mb-3">
                        <label class="form-label">Primary use case</label>
                        <select
                          v-model="form.use_case"
                          class="form-select"
                          :class="{ 'is-invalid': form.errors.use_case }"
                        >
                          <option>Marketing & Promotions</option>
                          <option>Customer Support</option>
                          <option>Transactional Updates</option>
                          <option>Other</option>
                        </select>
                        <div class="invalid-feedback">{{ form.errors.use_case }}</div>
                      </div>

                      <div class="mb-3">
                        <label class="form-label">Message</label>
                        <textarea
                          v-model="form.message"
                          class="form-control"
                          :class="{ 'is-invalid': form.errors.message }"
                          placeholder="Tell us about your requirements..."
                          rows="4"
                        ></textarea>
                        <div class="invalid-feedback">{{ form.errors.message }}</div>
                      </div>

                      <button
                        type="submit"
                        class="btn btn_global btn_primary w-100"
                        :disabled="form.processing"
                      >
                        {{ form.processing ? 'Submitting...' : 'Schedule Demo' }}
                      </button>
                    </form>


                  </div>

                  <!-- Login Tab -->
                  <div
                    class="tab-pane fade"
                    id="login"
                    role="tabpanel"
                    aria-labelledby="login-tab"
                  > 

                    <!-- <form>
                      <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input
                          type="email"
                          class="form-control"
                          placeholder="Enter your email"
                        />
                      </div>
                      <div class="mb-3">
                        <label class="form-label">Password</label>
                        <input
                          type="password"
                          class="form-control"
                          placeholder="Enter your password"
                        />
                      </div>

                      <button
                        type="submit"
                        class="btn btn_global btn_primary w-100"
                      >
                        Login
                      </button>

                      <div class="divider_text">OR</div>
                      <div class="social_btn_wrapper">
                        <a href="#" class="social_btn google">
                          <i class="fa-brands fa-google"></i> Sign in with
                          Google
                        </a>
                        <a href="#" class="social_btn facebook">
                          <i class="fa-brands fa-facebook-f"></i> Sign in with
                          Facebook
                        </a>
                      </div>
                    </form> -->
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Tailored Solutions Section -->
    <section class="tailored_section mt-60 mb-60" id="solution">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">
            Tailored for Your <span class="highlight">Business</span> Needs
          </h2>
          <p class="desc">
            From startups to enterprises, our WhatsApp Business solutions adapt
            to your goals—helping you boost engagement, automate support, and
            scale customer communication with ease.
          </p>
        </div>

        <div class="row">
          <!-- By Industry -->
          <div class="col-lg-6">
            <h3 class="subsection_title">By Industry</h3>
            <div class="row g-3">
              <div class="col-md-6">
                <div class="industry_card">
                  <i class="fa-solid fa-graduation-cap"></i>
                  <span>Education</span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="industry_card">
                  <i class="fa-solid fa-house-chimney"></i>
                  <span>Real Estate</span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="industry_card">
                  <i class="fa-solid fa-plane"></i>
                  <span>Travel</span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="industry_card">
                  <i class="fa-solid fa-heart-pulse"></i>
                  <span>Healthcare</span>
                </div>
              </div>
              <div class="col-md-6">
                <div class="industry_card">
                  <i class="fa-solid fa-chart-line"></i>
                  <span>Finance</span>
                </div>
              </div>
            </div>
          </div>

          <!-- For Teams -->
          <div class="col-lg-6">
            <div class="team_card_content">
              <h3 class="subsection_title">For Teams</h3>
              <div class="team_card_wrapper">
                <div class="team_card">
                  <div class="icon_box">
                    <i class="fa-solid fa-chart-simple"></i>
                  </div>
                  <div class="content">
                    <h4>Sales</h4>
                    <p>Close deals faster on WhatsApp.</p>
                  </div>
                </div>
                <div class="team_card">
                  <div class="icon_box">
                    <i class="fa-solid fa-bullhorn"></i>
                  </div>
                  <div class="content">
                    <h4>Marketing</h4>
                    <p>Run campaigns that convert.</p>
                  </div>
                </div>
                <div class="team_card">
                  <div class="icon_box">
                    <i class="fa-solid fa-headset"></i>
                  </div>
                  <div class="content">
                    <h4>Customer Support</h4>
                    <p>Resolve queries instantly.</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <section class="blogs_section pt-50 pb-50" id="resources">
      <div class="container">
        <div class="row align-items-center blog_heading_row">
          <div class="col-lg-8">
            <div class="section_heading">
              <h2 class="section_title text-white">Blogs</h2>
              <p class="desc">
                A complete guide to using WhatsApp Business tools for
                broadcasts, automation, analytics, and customer engagement to
                grow your business efficiently.
              </p>
            </div>
          </div>
          <div class="col-lg-4 text-lg-end">
            <a href="#" class="btn btn_global btn_primary">More Blogs</a>
          </div>
        </div>

        <!-- Slider -->
        <div class="swiper blogs_slider">
          <div class="swiper-wrapper">
            <!-- Blog 1 -->
            <div class="swiper-slide">
              <div class="blog_card">
                <div class="blog_image">
                  <img
                    src="@/assets/images/blog-img-1.webp"
                    alt="Instant Customer Engagement"
                    class="img-fluid"
                  />
                </div>
                <div class="blog_content">
                  <div
                    class="d-flex justify-content-between align-items-center mb-2"
                  >
                    <span class="date">
                      <i class="fa-regular fa-calendar"></i> November 28, 2026
                    </span>
                    <span class="badge">WhatsApp Solutions</span>
                  </div>
                  <h3>Instant Customer Engagement</h3>
                  <p>
                    Learn how WhatsApp Business helps you connect with customers
                    instantly through verified messaging, quick replies, and
                    real-time conversations.
                  </p>
                  <a href="#" class="read_more_link">
                    READ MORE <i class="fa-solid fa-arrow-right"></i>
                  </a>
                </div>
              </div>
            </div>

            <!-- Blog 2 -->
            <div class="swiper-slide">
              <div class="blog_card">
                <div class="blog_image">
                  <img
                    src="@/assets/images/blog-img-2.webp"
                    alt="Automation & Faster Responses"
                    class="img-fluid"
                  />
                </div>
                <div class="blog_content">
                  <div
                    class="d-flex justify-content-between align-items-center mb-2"
                  >
                    <span class="date">
                      <i class="fa-regular fa-calendar"></i> November 28, 2026
                    </span>
                    <span class="badge">WhatsApp Solutions</span>
                  </div>
                  <h3>Automation & Faster Responses</h3>
                  <p>
                    Discover how chatbots and automated workflows reduce
                    response time, handle FAQs, and provide 24/7 customer
                    support without increasing workload.
                  </p>
                  <a href="#" class="read_more_link">
                    READ MORE <i class="fa-solid fa-arrow-right"></i>
                  </a>
                </div>
              </div>
            </div>

            <!-- Blog 3 -->
            <div class="swiper-slide">
              <div class="blog_card">
                <div class="blog_image">
                  <img
                    src="@/assets/images/blog-img-3.webp"
                    alt="Scalable Messaging"
                    class="img-fluid"
                  />
                </div>
                <div class="blog_content">
                  <div
                    class="d-flex justify-content-between align-items-center mb-2"
                  >
                    <span class="date">
                      <i class="fa-regular fa-calendar"></i> November 28, 2026
                    </span>
                    <span class="badge">WhatsApp Solutions</span>
                  </div>
                  <h3>Scalable Messaging For Business Growth</h3>
                  <p>
                    Explore how WhatsApp Business API enables bulk messaging,
                    smart campaigns, and analytics to scale customer
                    communication while maintaining a personal touch.
                  </p>
                  <a href="#" class="read_more_link">
                    READ MORE <i class="fa-solid fa-arrow-right"></i>
                  </a>
                </div>
              </div>
            </div>
          </div>

          <div class="swiper-pagination"></div>
        </div>
      </div>
    </section>
    <!-- Testimonials Section -->
    <section v-if="props.reviews?.length > 0" class="testimonials_section pt-50 pb-50">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">
            <span class="highlight">Customers</span> Love Us!
          </h2>
          <p class="desc">
            Helping businesses grow faster with powerful, easy-to-use WhatsApp
            solutions.
          </p>
        </div>

        <div class="row align-items-center">
          <div class="col-lg-5 mb-4 mb-lg-0">
            <div class="testimonial_image">
              <img
                src="@/assets/images/reviews-img.webp"
                alt="Customer"
                class="img-fluid"
              />
            </div>
          </div>
          <div class="col-lg-7">
            <div class="swiper testimonial_slider">
              <div class="swiper-wrapper">
                <!-- Slide 1 -->
                <div v-for="(item, index) in props.reviews" :key="index"  class="swiper-slide">
                  <div class="testimonial_content ps-lg-4">
                    <div class="quote_icon">
                      <i class="fa-solid fa-quote-left"></i>
                    </div>
                    <p class="testimonial_text lead text-secondary mb-4">
                      {{ item.review }}
                    </p>
                    <div
                      class="d-flex align-items-center justify-content-between"
                    >
                      <div class="user_info d-flex align-items-center gap-3">
                        <img
                          src="https://randomuser.me/api/portraits/men/32.jpg"
                          class="rounded-circle"
                          width="60"
                          height="60"
                          alt="Marvin McKinney"
                        />
                        <div>
                          <h5>{{ item.name }}</h5>
                          <p>{{ item.position }}</p>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- External Nav Buttons (in the column, relative to the slider content area) -->
              <div
                class="testimonial_nav_wrapper d-flex justify-content-end gap-2 mt-3 pe-3"
              >
                <button
                  class="btn btn-outline-secondary rounded-circle testimonial-prev"
                >
                  <i class="fa-solid fa-chevron-left"></i>
                </button>
                <button
                  class="btn btn-outline-secondary rounded-circle testimonial-next"
                >
                  <i class="fa-solid fa-chevron-right"></i>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <FAQ :faqs="props.faqs" />
    
    <!-- Footer -->
    <Footer :companyConfig="props.companyConfig" />
</template>
<style>
  .accordion-button {
  background: transparent;
  border: none;
  width: 100%;
  text-align: left;
  padding: 1.25rem;
  font-weight: 600;
  font-size: 1rem;
  cursor: pointer;
}

.accordion-button.active {
  color: #16a34a; /* green */
}

.accordion-body-wrapper {
  overflow: hidden;
}

.transition {
  transition: transform 0.3s ease;
}

.rotate {
  transform: rotate(180deg);
}

</style>
<script setup>
import { ref, computed, onMounted, onBeforeUnmount, nextTick, watch } from 'vue'
import { Link, useForm, usePage} from '@inertiajs/vue3'
import Navbar from './Partials/Navbar.vue'
import Footer from './Partials/Footer.vue'
import Pricing from './Partials/Pricing.vue'
import FAQ from './Partials/FAQ.vue'
import { toast } from 'vue3-toastify';

const props = defineProps(['addons', 'enable_ai_billing', 'faqs', 'plans', 'reviews', 'companyConfig', 'languages', 'currentLanguage', 'currency', 'pages', 'config', 'flash']);

// --------------------
// State
// --------------------
const isYearly = ref(false)
const showComparison = ref(false)

const activeIndex = ref(0)

const toggle = (index) => {
  activeIndex.value = activeIndex.value === index ? null : index
}

const form = useForm({
  name: '',
  email: '',
  phone: '',
  use_case: 'Marketing & Promotions',
  type: 'DEMO',
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

// Swiper instances
let trustedSlider = null
let blogsSlider = null
let testimonialSlider = null

// --------------------
// Methods
// --------------------
const togglePricing = () => {
  isYearly.value = !isYearly.value
}

const toggleComparison = () => {
  showComparison.value = !showComparison.value
}

const handleScroll = () => {
  const header = document.querySelector('.main_header')
  if (!header) return

  header.classList.toggle('fixed_header', window.scrollY > 50)
}

// --------------------
// Lifecycle
// --------------------
onMounted( async () => {
  // Trusted Brands Slider
  trustedSlider = new window.Swiper('.trusted_brands_slider', {
    slidesPerView: 2,
    spaceBetween: 20,
    loop: true,
    autoplay: {
      delay: 2500,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.trusted-pagination',
      clickable: true,
    },
    breakpoints: {
      576: { slidesPerView: 3, spaceBetween: 30 },
      768: { slidesPerView: 4, spaceBetween: 40 },
      992: { slidesPerView: 4, spaceBetween: 50 },
      1200: { slidesPerView: 5, spaceBetween: 60 },
    },
  })

  // Blogs Slider
  blogsSlider = new window.Swiper('.blogs_slider', {
    slidesPerView: 1,
    spaceBetween: 20,
    loop: true,
    autoplay: {
      delay: 3000,
      disableOnInteraction: false,
    },
    pagination: {
      el: '.blogs-pagination',
      clickable: true,
    },
    breakpoints: {
      0: { slidesPerView: 1.1, spaceBetween: 20 },
      768: { slidesPerView: 2, spaceBetween: 30 },
      992: { slidesPerView: 3, spaceBetween: 30 },
    },
  })

  // Testimonial Slider
  await nextTick() // wait until v-for renders slides
  testimonialSlider = new window.Swiper('.testimonial_slider', {
    slidesPerView: 1,
    spaceBetween: 30,
    loop: true,
    navigation: {
      nextEl: '.testimonial-next',
      prevEl: '.testimonial-prev',
    },
  })
  // Sticky header
  window.addEventListener('scroll', handleScroll)
})

 watch(() => [usePage().props.flash, { deep: true }], () => {
      if(usePage().props.flash.status != null){
          toast(usePage().props.flash.status.message, {
              autoClose: 3000,
          });
      }
  });

onBeforeUnmount(() => {
  window.removeEventListener('scroll', handleScroll)

  trustedSlider?.destroy()
  blogsSlider?.destroy()
  testimonialSlider?.destroy()
})
</script>


