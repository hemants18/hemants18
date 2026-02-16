<template>
	<Navbar />
	<!-- Pricing Hero -->
    <section
      id="pricing"
      class="pt-48 pb-32 bg-gradient-to-r from-emerald-100/60 via-teal-50 to-cyan-100/60 relative"
    >
      <div class="container mx-auto px-6 relative z-10">
        <div class="text-center max-w-3xl mx-auto mb-16 reveal">
          <span
            class="bg-white text-emerald-600 font-bold text-xs uppercase tracking-widest px-4 py-2 rounded-full shadow-sm mb-6 inline-block"
            >Pricing Plans</span
          >
          <h2
            class="text-5xl md:text-6xl font-extrabold text-slate-900 mt-4 mb-6 tracking-tight"
          >
            Simple & <span class="text-green-500">Transparent</span>
          </h2>
          <p
            class="text-slate-600 text-lg max-w-2xl mx-auto mb-10 leading-relaxed"
          >
            Choose the perfect plan for your business needs. No hidden fees,
            cancel anytime.
          </p>

          <!-- Pricing Toggle -->
          <div class="flex items-center justify-center gap-4">
            <span
              class="text-slate-900 font-bold text-sm uppercase tracking-wide"
              >Monthly</span
            >
            <label
              class="relative inline-flex items-center cursor-pointer hover:scale-105 transition-transform"
            >
              <input
                type="checkbox"
                id="pricing-toggle"
                @click="billingPeriod = billingPeriod === 'monthly' ? 'yearly' : 'monthly'"
                class="sr-only peer"
              />
              <div
                class="w-16 h-8 bg-white peer-focus:outline-none rounded-full peer shadow-md border border-slate-200 peer-checked:after:translate-x-full after:content-[''] after:absolute after:top-[4px] after:left-[4px] after:bg-slate-900 after:rounded-full after:h-6 after:w-7 after:transition-all peer-checked:bg-white peer-checked:after:bg-green-500"
              ></div>
            </label>
            <span
              class="text-slate-900 font-bold text-sm uppercase tracking-wide"
              >Yearly
             <!--  <span
                class="text-green-600 text-[10px] bg-white px-2 py-0.5 rounded-full shadow-sm ml-1 border border-green-100 absolute -top-3 -right-6 animate-bounce"
                >-20%</span
              > --></span
            >
          </div>
        </div>

        <!-- Pricing Cards -->
        <div class="grid md:grid-cols-3 gap-8 max-w-7xl mx-auto">
          <!-- Starter Plan -->
          <div
            class="relative bg-white rounded-[2.5rem] p-8 border border-slate-200 shadow-xl shadow-slate-200/50 hover:shadow-2xl hover:-translate-y-2 transition-all duration-300 flex flex-col group reveal"  v-for="(plan, name) in groupedPlans"
            	:key="name"
          >
            <div class="mb-4">
              <div
              	
                class="w-12 h-12 bg-emerald-100 rounded-2xl flex items-center justify-center text-emerald-600 mb-4 group-hover:scale-110 transition-transform"
              >
                <i class="ri-rocket-line text-2xl"></i>
              </div>
              <h3 class="text-2xl font-bold text-slate-900">{{ name }}</h3>
              <!-- <p class="text-slate-500 mt-2 text-sm leading-relaxed">
                Perfect for small businesses just getting started with WhatsApp
                automation.
              </p> -->
            </div>

            <div class="flex items-baseline gap-1 mb-8">
              <span
                class="text-5xl font-extrabold text-slate-900 tracking-tight"
                >{{currency}}<span class="price-amount" data-monthly="{{ formatPrice(plan[billingPeriod]?.price) }}" data-annual="{{ formatPrice(plan[billingPeriod]?.price) }}"
                  >{{ formatPrice(plan[billingPeriod]?.price) }}</span
                ></span
              >
              <span class="text-slate-400 font-medium price-period"
                >/{{ billingPeriod === 'monthly' ? 'mo' : 'yr' }}</span
              >
            </div>

            <Link
              href="/signup"
              class="btn btn-outline w-full justify-center rounded-xl py-4 border-slate-200 text-slate-700 hover:text-brand hover:border-brand transition-all"
              >Get Started</Link
            >

            <div class="mt-8 space-y-4 flex-1">
              <p
                class="text-xs font-bold text-slate-400 uppercase tracking-widest"
              >
                What's included:
              </p>
              <ul class="space-y-3 text-sm text-slate-600">
                <li v-for="(value, key) in parseMeta(plan[billingPeriod]?.metadata)"
                :key="key" class="flex items-start gap-3">

                	<template v-if="key === 'addons'">
                  <div
                    v-for="(val, k) in value"
                    :key="k"
                    class="flex items-center gap-2"
                  >
                    <i class="ri-check-line text-emerald-600 text-xs"></i> {{ label(k) }} : 
                    <strong>{{ val === '-1' ? 'Unlimited' : val }}</strong>
                  </div>
                </template>

                <template v-else>
                  <i class="ri-check-line text-emerald-600 text-xs"></i> {{ label(key) }} :
                  <strong>{{ value === '-1' ? 'Unlimited' : value }}</strong>
                </template>
                 </li>
                 <li v-if="!plan[billingPeriod]">
                <span>
                  Not available
                </span>
              </li>
              </ul>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Optional Add-ons -->
    <!-- <section class="py-20 border-b border-slate-100 bg-white">
      <div class="container mx-auto px-6">
        <div class="text-center max-w-2xl mx-auto mb-16">
          <h2 class="text-3xl font-bold text-slate-900">Power-Up Add-ons</h2>
          <p class="text-slate-500 mt-2">
            Customize your plan with these optional extras.
          </p>
        </div>

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6 max-w-5xl mx-auto">
          <div
            class="p-6 rounded-2xl border border-slate-100 hover:border-brand/30 hover:shadow-lg transition-all group cursor-pointer bg-slate-50 hover:bg-white reveal"
          >
            <div class="flex items-start justify-between mb-4">
              <div
                class="w-10 h-10 rounded-full bg-white border border-slate-200 flex items-center justify-center text-brand shadow-sm"
              >
                <i class="ri-verified-badge-line text-xl"></i>
              </div>
              <span
                class="text-sm font-bold bg-white border border-slate-200 px-3 py-1 rounded-full text-slate-700"
                >$99
                <span class="text-xs font-normal text-slate-400"
                  >/one-time</span
                ></span
              >
            </div>
            <h4
              class="text-lg font-bold text-slate-900 group-hover:text-brand transition-colors"
            >
              Green Tick Verification
            </h4>
            <p class="text-sm text-slate-500 mt-2">
              Expert assistance to apply for and secure the official WhatsApp
              Green Tick badge.
            </p>
          </div>

          <div
            class="p-6 rounded-2xl border border-slate-100 hover:border-brand/30 hover:shadow-lg transition-all group cursor-pointer bg-slate-50 hover:bg-white reveal delay-100"
          >
            <div class="flex items-start justify-between mb-4">
              <div
                class="w-10 h-10 rounded-full bg-white border border-slate-200 flex items-center justify-center text-blue-600 shadow-sm"
              >
                <i class="ri-robot-2-line text-xl"></i>
              </div>
              <span
                class="text-sm font-bold bg-white border border-slate-200 px-3 py-1 rounded-full text-slate-700"
                >$49
                <span class="text-xs font-normal text-slate-400"
                  >/mo</span
                ></span
              >
            </div>
            <h4
              class="text-lg font-bold text-slate-900 group-hover:text-blue-600 transition-colors"
            >
              Advanced AI Flow Builder
            </h4>
            <p class="text-sm text-slate-500 mt-2">
              Access to premium drag-and-drop nodes, API webhooks, and complex
              logic flows.
            </p>
          </div>

          <div
            class="p-6 rounded-2xl border border-slate-100 hover:border-brand/30 hover:shadow-lg transition-all group cursor-pointer bg-slate-50 hover:bg-white reveal delay-200"
          >
            <div class="flex items-start justify-between mb-4">
              <div
                class="w-10 h-10 rounded-full bg-white border border-slate-200 flex items-center justify-center text-purple-600 shadow-sm"
              >
                <i class="ri-user-add-line text-xl"></i>
              </div>
              <span
                class="text-sm font-bold bg-white border border-slate-200 px-3 py-1 rounded-full text-slate-700"
                >$10
                <span class="text-xs font-normal text-slate-400"
                  >/seat/mo</span
                ></span
              >
            </div>
            <h4
              class="text-lg font-bold text-slate-900 group-hover:text-purple-600 transition-colors"
            >
              Additional Seats
            </h4>
            <p class="text-sm text-slate-500 mt-2">
              Add more team members to your workspace as your support team
              grows.
            </p>
          </div>
        </div>
      </div>
    </section> -->

    <!-- Money Back Guarantee -->
    <section class="py-16 bg-white overflow-hidden relative">
      <div
        class="absolute top-0 left-0 w-full h-px bg-gradient-to-r from-transparent via-slate-200 to-transparent"
      ></div>
      <div class="container mx-auto px-6">
        <div
          class="bg-gradient-to-br from-slate-900 to-slate-800 rounded-3xl p-8 md:p-12 text-center md:text-left flex flex-col md:flex-row items-center gap-10 shadow-2xl relative overflow-hidden reveal"
        >
          <!-- Decor -->
          <div
            class="absolute top-0 right-0 w-64 h-64 bg-brand rounded-full blur-[100px] opacity-20 pointer-events-none"
          ></div>

          <div class="relative z-10 md:w-2/3">
            <div
              class="inline-flex items-center gap-2 bg-white/10 backdrop-blur-md border border-white/10 rounded-full px-3 py-1 text-xs font-bold text-white uppercase tracking-widest mb-6"
            >
              <i class="ri-shield-check-fill text-brand"></i> Risk Free
            </div>
            <h2 class="text-3xl md:text-4xl font-extrabold text-white mb-4">
              30-Day Money-Back Guarantee
            </h2>
            <p class="text-slate-300 text-lg leading-relaxed">
              We're confident WaBizBoost will transform your business. If you're
              not satisfied within the first 30 days, we'll refund your
              subscription in full. No questions asked.
            </p>
          </div>
          <div class="relative z-10 md:w-1/3 flex justify-center">
            <div
              class="w-40 h-40 bg-gradient-to-br from-brand to-emerald-600 rounded-full flex items-center justify-center shadow-glow animate-float"
            >
              <div
                class="w-32 h-32 bg-white rounded-full flex items-center justify-center shadow-inner"
              >
                <i class="ri-thumb-up-fill text-5xl text-brand"></i>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Social Proof / Testimonials -->
    <section v-if="props.reviews.length > 0" class="py-20 bg-slate-50">
      <div class="container mx-auto px-6">
        <div class="text-center mb-16 reveal">
          <h2 class="text-3xl font-bold text-slate-900">
            Trusted by Market Leaders
          </h2>
        </div>
        <div class="grid md:grid-cols-3 gap-8">
          <!-- Testimonial 1 -->
          <div
          	v-for="(item, index) in props.reviews" :key="index"
            class="bg-white p-8 rounded-2xl shadow-sm border border-slate-100 hover:-translate-y-1 transition-transform reveal"
          >
            <div class="flex text-yellow-400 mb-4 text-sm">
              <i
			    v-for="n in item.rating"
			    :key="n"
			    class="ri-star-fill"
			  ></i>
            </div>
            <p class="text-slate-600 mb-6 italic">
              {{ item.review }}
            </p>
            <div class="flex items-center gap-4">
              <img
                src="https://randomuser.me/api/portraits/men/32.jpg"
                alt="User"
                class="w-10 h-10 rounded-full"
              />
              <div>
                <h5 class="font-bold text-sm text-slate-900">{{ item.name }}</h5>
                <p class="text-xs text-slate-500">{{ item.position }}</p>
              </div>
            </div>
          </div>

        </div>
      </div>
    </section>

    <!-- Comparison Table -->
    <!-- <section class="py-24 bg-white border-t border-slate-100">
      <div class="container mx-auto px-6">
        <div class="text-center max-w-3xl mx-auto mb-16 reveal">
          <h2 class="text-4xl font-bold text-slate-900 mb-4">
            Compare Features
          </h2>
          <p class="text-slate-600">
            Detailed breakdown of what's included in each plan.
          </p>
        </div>

        <div class="overflow-x-auto reveal delay-100">
          <table
            class="w-full max-w-5xl mx-auto border-separate border-spacing-0"
          >
            <thead>
              <tr>
                <th class="text-left p-6 bg-transparent"></th>
                <th class="p-6 text-xl font-bold text-slate-900 text-center">
                  Starter
                </th>
                <th
                  class="p-6 text-xl font-bold text-brand text-center bg-slate-50 rounded-t-2xl shadow-sm border-t border-x border-slate-100"
                >
                  Pro
                </th>
                <th class="p-6 text-xl font-bold text-slate-900 text-center">
                  Enterprise
                </th>
              </tr>
            </thead>
            <tbody class="text-slate-600">
              <tr class="hover:bg-slate-50/50 transition-colors">
                <td
                  class="p-6 font-bold text-slate-900 border-b border-slate-200"
                >
                  Conversations
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  1,000 /mo
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 bg-slate-50 border-x border-slate-100 font-bold text-slate-900"
                >
                  10,000 /mo
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  Unlimited
                </td>
              </tr>
              <tr class="hover:bg-slate-50/50 transition-colors">
                <td
                  class="p-6 font-bold text-slate-900 border-b border-slate-200"
                >
                  User Seats
                </td>
                <td class="p-6 text-center border-b border-slate-200">1</td>
                <td
                  class="p-6 text-center border-b border-slate-200 bg-slate-50 border-x border-slate-100 font-bold text-slate-900"
                >
                  5
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  Unlimited
                </td>
              </tr>
              <tr class="hover:bg-slate-50/50 transition-colors">
                <td
                  class="p-6 font-bold text-slate-900 border-b border-slate-200"
                >
                  Broadcasts
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 bg-slate-50 border-x border-slate-100"
                >
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
              </tr>
              <tr class="hover:bg-slate-50/50 transition-colors">
                <td
                  class="p-6 font-bold text-slate-900 border-b border-slate-200"
                >
                  API Access
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 text-slate-400"
                >
                  -
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 bg-slate-50 border-x border-slate-100"
                >
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
              </tr>
              <tr class="hover:bg-slate-50/50 transition-colors">
                <td
                  class="p-6 font-bold text-slate-900 border-b border-slate-200"
                >
                  Green Tick Verification
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 text-slate-400"
                >
                  -
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 bg-slate-50 border-x border-slate-100"
                >
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
              </tr>
              <tr class="hover:bg-slate-50/50 transition-colors">
                <td
                  class="p-6 font-bold text-slate-900 border-b border-slate-200"
                >
                  Dedicated Support
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 text-slate-400"
                >
                  -
                </td>
                <td
                  class="p-6 text-center border-b border-slate-200 bg-slate-50 border-x border-slate-100 text-slate-400"
                >
                  -
                </td>
                <td class="p-6 text-center border-b border-slate-200">
                  <i class="ri-checkbox-circle-fill text-green-500"></i>
                </td>
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </section> -->

    <!-- Final CTA -->
    <section class="py-24 bg-slate-900 text-center relative overflow-hidden">
      <div class="absolute inset-0 bg-brand/10 z-0"></div>
      <div class="container mx-auto px-6 relative z-10 max-w-4xl reveal">
        <h2 class="text-4xl md:text-5xl font-extrabold text-white mb-6">
          Start your 14-day free trial
        </h2>
        <p class="text-xl text-slate-400 mb-10">
          No credit card required. Cancel anytime.
        </p>
        <div
          class="flex flex-col sm:flex-row items-center justify-center gap-4"
        >
          <a href="contact.html" class="btn btn-primary text-lg px-8 py-4"
            >Get Started Now</a
          >
          <a
            href="contact.html"
            class="btn btn-outline text-white border-white/20 bg-white/10 hover:bg-white/20 hover:border-white/30 text-lg px-8 py-4 backdrop-blur-md"
            >Talk to Sales</a
          >
        </div>
      </div>
    </section>

    <!-- FAQ -->
    <section v-if="props.faqs.data.length > 0" class="py-24 bg-slate-50">
	  <div class="container mx-auto px-6 max-w-3xl reveal">
	    <h2
	      class="text-3xl md:text-4xl font-extrabold text-slate-900 mb-12 text-center"
	    >
	      Frequently Asked <span class="text-brand">Questions</span>
	    </h2>

	    <div class="space-y-4">
	      <div
	        v-for="(item, index) in props.faqs.data"
	        :key="index"
	        class="bg-white rounded-xl shadow-sm hover:shadow-md transition-all duration-300 overflow-hidden cursor-pointer"
	        @click="toggleFaq(index)"
	      >
	        <!-- Question -->
	        <div class="p-6 flex items-center justify-between gap-4">
	          <h3
	            class="text-lg font-bold text-slate-900 select-none"
	            v-html="item.question"
	          ></h3>

	          <i
	            class="faq-icon ri-arrow-down-s-line text-2xl text-slate-400 transition-transform duration-300"
	            :class="{ 'rotate-180': activeFaq === index }"
	          ></i>
	        </div>

	        <!-- Answer -->
	        <div
	          class="faq-content overflow-hidden transition-all duration-500 ease-in-out"
	          :style="{
	            maxHeight: activeFaq === index ? '500px' : '0px'
	          }"
	        >
	          <div
	            class="px-6 pb-6 text-slate-600 leading-relaxed border-t border-slate-100 pt-4"
	            v-html="item.answer"
	          ></div>
	        </div>
	      </div>
	    </div>
	  </div>
	</section>

    <Footer :companyConfig="props.companyConfig"/>
</template>

 <script setup>
 	import { ref, computed, onMounted, onBeforeUnmount } from 'vue'
	import { Link } from '@inertiajs/vue3'
	import Navbar from './Partials/Navbar.vue'
	import Footer from './Partials/Footer.vue'
	const props = defineProps(['companyConfig', 'reviews', 'faqs', 'plans', 'currency']);

	const billingPeriod = ref('monthly')
	const activeFaq = ref(null)
	let observer = null

	function initScrollReveal() {
	  const observerOptions = {
	    threshold: 0.1,
	    rootMargin: '0px 0px -50px 0px',
	  }

	  observer = new IntersectionObserver(entries => {
	    entries.forEach(entry => {
	      if (entry.isIntersecting) {
	        entry.target.classList.add('active')
	      }
	    })
	  }, observerOptions)

	  document.querySelectorAll('.reveal').forEach(el => observer.observe(el))
	}

	onMounted(() => {
		initScrollReveal()
	})


	function toggleFaq(index) {
	  activeFaq.value = activeFaq.value === index ? null : index
	}

	const groupedPlans = computed(() => {
	  const map = {}

	  props.plans.forEach(plan => {
	    if (!map[plan.name]) {
	      map[plan.name] = {}
	    }

	    map[plan.name][plan.period] = plan
	  })
	  console.log(map);
	  return map
	})


	const formatPrice = (price) => {
	  return Number(price).toLocaleString()
	}

	const parseMeta = (meta) => {
	  try {
	    return JSON.parse(meta)
	  } catch {
	    return {}
	  }
	}

	const label = (text) =>
	  text.replaceAll('_', ' ').replace(/\b\w/g, l => l.toUpperCase())


</script>