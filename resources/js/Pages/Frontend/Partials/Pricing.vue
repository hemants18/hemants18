<!-- Pricing Section -->
<template>

  <section class="pricing_section pt-50 pb-50" id="pricing">
      <div class="container">
        <div class="section_heading text-center">
          <h2 class="section_title">
            Flexible <span class="highlight">Plans</span> for Every Scale
          </h2>
          <p class="desc">Choose the perfect plan for your business needs.</p>
        </div>

        <div class="pricing_toggle_container text-center">
          <span class="toggle_label active" id="monthly-label">Monthly</span>
          <div class="form-check form-switch d-inline-block">
            <input
              class="form-check-input"
              type="checkbox"
              @click="billingPeriod = billingPeriod === 'monthly' ? 'yearly' : 'monthly'"
              id="pricing-toggle"
            />
            <label class="form-check-label" for="pricing-toggle"></label>
          </div>
          <span class="toggle_label" id="yearly-label">Yearly</span>
        </div>

        <div class="row g-3 justify-content-center">
          <!-- Plan A -->
          <div v-if="getValueByKey('trial_period') != 0" class="col-lg-4 col-md-6">
            <div class="pricing_card">
              <div class="card_header">
                <h3 class="plan_name">Trial PLAN (Starter)</h3>
                <div class="price_box">
                  <span class="currency">{{ currency }}</span>
                  <span class="amount monthly_price">0</span>
                  <span class="amount yearly_price">0</span>
                  <span class="period">(Trial Only)</span>
                </div>
                <div class="trial_badge">{{ getValueByKey('trial_period') }} Days Free Trial</div>
              </div>
              <ul class="feature_list">
                <li v-for="(value, key) in parseMeta(getValueByKey('trial_limits'))" :key="key">
                    <i class="fa-solid fa-circle-check"></i> {{ label(key) }} :
                    <strong>{{ value === '-1' ? 'Unlimited' : value }}</strong>
                </li>
              </ul>
              <a href="/signup" class="btn btn_global btn_outline"
                >Start {{ getValueByKey('trial_period') }} Days Trial</a
              >
            </div>
          </div>

          <!-- Plan B -->
          <div v-for="(plan, name) in groupedPlans" :key="name" class="col-lg-4 col-md-6">
            <div class="pricing_card popular">
              <!-- <div class="popular_badge">MOST POPULAR</div> -->
              <div class="card_header">
                <h3 class="plan_name">{{ name }}</h3>
                <div class="price_box">
                  <span class="currency">{{ currency }}</span>
                  <span class="amount monthly_price">{{ formatPrice(plan[billingPeriod]?.price) }}</span>
                  <span class="amount yearly_price">{{ formatPrice(plan[billingPeriod]?.price) }}</span>
                  <span class="period">/ {{ billingPeriod === 'monthly' ? 'month' : 'year' }}</span>
                </div>
                <div class="yearly_badge">{{ formatPrice(plan[billingPeriod]?.price) }} / {{ billingPeriod === 'monthly' ? 'mo' : 'yr' }}</div>
              </div>
              <ul class="feature_list">
                <li v-for="(value, key) in parseMeta(plan[billingPeriod]?.metadata)"
                :key="key">

                  <template v-if="key === 'addons'">
                  <span
                    v-for="(val, k) in value"
                    :key="k"
                    class="addons"
                  >
                    <i class="fa-solid fa-circle-check" :class="iconClass(val)"></i> {{ label(k) }} : 
                    <strong>{{ val === '-1' ? 'Unlimited' : val }}</strong>
                  </span>
                </template>

                <template v-else>
                  <i class="fa-solid fa-circle-check" :class="iconClass(value)"></i> {{ label(key) }} :
                  <strong>{{ value === '-1' ? 'Unlimited' : value }}</strong>
                </template>
              </li>
              <li v-if="!plan[billingPeriod]">
                <span>
                  Not available
                </span>
              </li>
              </ul>
              <a :href="plan?.[billingPeriod]?.uuid ? `/signup?plan=${plan[billingPeriod].uuid}`: '/signup'" class="btn btn_global btn_primary">Get Started</a>
            </div>
          </div>
        </div>

        <div class="comparison_toggle text-center">
          <button class="btn_toggle_compare" :class="{ active: showComparison }" @click="showComparison = !showComparison" id="toggleComparison">
            See Detailed Comparison <i class="fa-solid fa-chevron-down"></i>
          </button>
        </div>

        <div
          class="comparison_table_wrapper"
          id="comparisonTable"
          v-show="showComparison"
        >
          <div class="table-responsive">
            <table class="table comparison_table">
              <thead>
                <tr>
                  <th class="feature_col">Feature Category</th>
                  <th v-if="getValueByKey('trial_period') != 0" class="plan_col">Trial PLAN <br /><!-- <span>(Starter)</span> --></th>
                  <th v-for="(plan, name) in groupedPlans" :key="name" class="plan_col ">
                    {{ name }} <br /><!-- <span>(Growth)</span> -->
                  </th>
                </tr>
              </thead>
              <tbody>
                <tr class="section_header">
                  <td colspan="4">PRICING</td>
                </tr>
                <tr v-if="getValueByKey('trial_period') != 0">
                  <td>Free Trial</td>
                  <td>{{ getValueByKey('trial_period') }} Days ({{ currency }} 0)</td>
                  <td  v-for="(plan, name) in groupedPlans" :key="name">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                </tr>
                <tr>
                  <td>Monthly (Billed Monthly)</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-xmark text-secondary"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ currency }} {{ formatPrice(plan['monthly']?.price) }} / month</td>
                </tr>
                <tr>
                  <td>Monthly (Billed Yearly)</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ currency }} {{ formatPrice(plan['yearly']?.price) }} / yearly</td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">WHATSAPP SETUP</td>
                </tr>
                <tr>
                  <td>WhatsApp Business API</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td  v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>
                <tr>
                  <td>Blue Tick Application Support</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>
                <tr>
                  <td>Business Verification Help</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">MESSAGING & CAMPAIGNS</td>
                </tr>
                <tr>
                  <td>Monthly Broadcasts</td>
                  <td v-if="getValueByKey('trial_period') != 0">Free {{ getDetail(getValueByKey('trial_limits'), 'campaigns') == '-1' ? $t('Unlimited') : getDetail(getValueByKey('trial_limits'), 'campaigns') }} ({{ getValueByKey('trial_period') }} days only)</td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ formatValue(getPlanValue(plan['monthly']?.name,'monthly','campaign_limit')) }} / month</td>
                </tr>
                <tr>
                  <td>Service Conversations (Replies)</td>
                  <td v-if="getValueByKey('trial_period') != 0">Unlimited</td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">Unlimited</td>
                </tr>
                <tr>
                  <td>Automation Triggers</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    {{ getDetail(getValueByKey('trial_limits'), 'automated_replies') == '-1' ? $t('Unlimited') : getDetail(getValueByKey('trial_limits'), 'automated_replies') }}
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ formatValue(getPlanValue(plan['monthly']?.name,'monthly','canned_replies_limit')) }} / month</td>
                </tr>
                <tr>
                  <td>API Calls</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td>10,000 / month</td>
                  <td>Unlimited</td>
                </tr>
                <tr>
                  <td>Campaign Retargeting</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">AUTOMATION & CHATBOTS</td>
                </tr>
                <tr>
                  <td>Chatbots</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ formatValue(getPlanValue(plan['monthly']?.name,'monthly','addons.Flow builder')) }}</td>
                </tr>
                <tr>
                  <td>Message Templates</td>
                  <td v-if="getValueByKey('trial_period') != 0">Unlimited</td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">Unlimited</td>
                </tr>
                <tr>
                  <td>Template Approval Support</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">CONTACTS & MANAGEMENT</td>
                </tr>
                <tr>
                  <td>Contact Management</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    {{ getDetail(getValueByKey('trial_limits'), 'contacts') == '-1' ? $t('Unlimited') : getDetail(getValueByKey('trial_limits'), 'contacts') }}
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ formatValue(getPlanValue(plan['monthly']?.name,'monthly','contacts_limit')) }}</td>
                </tr>
                <tr>
                  <td>Upload & Manage Contacts Group</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">TEAM & COLLABORATION</td>
                </tr>
                <tr>
                  <td>Team Members / Agents</td>
                  <td v-if="getValueByKey('trial_period') != 0">{{ getDetail(getValueByKey('trial_limits'), 'users') == '-1' ? $t('Unlimited') : getDetail(getValueByKey('trial_limits'), 'users') }}</td>
                  <td v-for="(plan, name) in groupedPlans" :key="name">{{ formatValue(getPlanValue(plan['monthly']?.name,'monthly','team_limit')) }}</td>
                </tr>
                <tr>
                  <td>Chat Inbox & Assignment</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>
                <tr>
                  <td>Tags & Segmentation</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">ANALYTICS & REPORTING</td>
                </tr>
                <tr>
                  <td>Analytics Level</td>
                  <td v-if="getValueByKey('trial_period') != 0">Basic</td>
                  <td>Basic</td>
                  <td>Advanced</td>
                </tr>
                <tr>
                  <td>Open & Read Reports</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>
                <tr>
                  <td>Campaign Performance Reports</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>

                <tr class="section_header">
                  <td colspan="4">SUPPORT & SETUP</td>
                </tr>
                <tr>
                  <td>Setup Assistance</td>
                  <td v-if="getValueByKey('trial_period') != 0">Basic</td>
                  <td>Standard</td>
                  <td>Priority</td>
                </tr>
                <tr>
                  <td>Support Tickets</td>
                  <td v-if="getValueByKey('trial_period') != 0">Basic</td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>
                <tr>
                  <td>Dedicated Manager</td>
                  <td v-if="getValueByKey('trial_period') != 0">
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td>
                    <i class="fa-solid fa-circle-xmark text-secondary"></i>
                  </td>
                  <td>Optional</td>
                </tr>
                <tr>
                  <td>QR Code & wa.me Links</td>
                  <td v-if="getValueByKey('trial_period') != 0"><i class="fa-solid fa-circle-check text-success"></i></td>
                  <td v-for="(plan, name) in groupedPlans" :key="name"><i class="fa-solid fa-circle-check text-success"></i></td>
                </tr>
              </tbody>

              <!-- <tbody>
                  <tr
                    v-for="(feature, featureKey) in comparisonFeatures"
                    :key="featureKey"
                  >
                    <td class="feature_col">
                      {{ feature.label }}
                    </td>

                    <td
                      v-for="(planGroup, planName) in groupedPlans"
                      :key="planName"
                      class="plan_col"
                    >
                      <template v-if="getFeatureValue(planGroup[billingPeriod], featureKey) !== null">
                        <template
                          v-if="getFeatureValue(planGroup[billingPeriod], featureKey) === '-1'"
                        >
                          Unlimited
                        </template>

                        <template
                          v-else-if="getFeatureValue(planGroup[billingPeriod], featureKey) === true"
                        >
                          <i class="fa-solid fa-circle-check text-success"></i>
                        </template>

                        <template
                          v-else-if="getFeatureValue(planGroup[billingPeriod], featureKey) === false"
                        >
                          <i class="fa-solid fa-circle-xmark text-secondary"></i>
                        </template>

                        <template v-else>
                          {{ getFeatureValue(planGroup[billingPeriod], featureKey) }}
                        </template>
                      </template>

                      <template v-else>
                        <i class="fa-solid fa-circle-xmark text-secondary"></i>
                      </template>
                    </td>
                  </tr>
                </tbody> -->


            </table>
          </div>
        </div>
      </div>
    </section>

</template>


<script setup>
import { ref, computed } from 'vue'
import { Link } from '@inertiajs/vue3'

const props = defineProps({
  plans: Array,
  config: Array,
  currency: String,
})

const billingPeriod = ref('monthly')
const showComparison = ref(false);

const getValueByKey = (key) => {
    const found = props.config.find(item => item.key === key);
    return found ? found.value : '';
};

const getPlanValue = (planName, period, key) => {
  const plan = groupedPlans.value?.[planName]?.[period]
  // console.log(parseMeta(plan.metadata).campaign_limit);
  if (!plan) return null

  // Handle nested keys like "addons.Flow builder"
  if (key.includes('.')) {
    const keys = key.split('.')
    return keys.reduce((obj, k) => obj?.[k], parseMeta(plan.metadata))
  }
  const metadata  = plan.metadata ? parseMeta(plan.metadata) : {};
  return metadata?.[key] ?? null
}

const formatValue = (val) => {
  if (val === '-1') return 'Unlimited'
  if (val === false) return "N/A"
  return val
}

const groupedPlans = computed(() => {
  const map = {}

  props.plans.forEach(plan => {
    if (!map[plan.name]) {
      map[plan.name] = {}
    }

    map[plan.name][plan.period] = plan
  })
  return map
})

const iconClass = (val) => {
  if (
    val === false ||
    val === 0 ||
    val === null ||
    val === '' ||
    val === '0'
  ) {
    return 'fa-circle-xmark text-danger'
  }

  return 'fa-circle-check text-success'
}

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
  
const getDetail = (value, key) => {
    if(value){
        const item = parseMeta(value);
        return item?.[key] ?? null;
    } else {
        return null;
    }
}

const label = (text) =>
  text.replaceAll('_', ' ').replace(/\b\w/g, l => l.toUpperCase())

const getFeatureValue = (plan, featureKey) => {
  if (!plan) return null

  const meta = parseMeta(plan.metadata)

  // addon case
  if (featureKey.startsWith('addons.')) {
    const addonKey = featureKey.split('.')[1]
    return meta.addons?.[addonKey] ?? null
  }

  return meta[featureKey] ?? null
}


const comparisonFeatures = computed(() => {
  const features = {}

  Object.values(groupedPlans.value).forEach(planGroup => {
    Object.values(planGroup).forEach(plan => {
      const meta = parseMeta(plan.metadata)

      Object.entries(meta).forEach(([key, value]) => {
        if (key === 'addons') {
          Object.keys(value).forEach(addonKey => {
            features[`addons.${addonKey}`] = {
              label: label(addonKey),
              type: 'addon',
            }
          })
        } else {
          features[key] = {
            label: label(key),
            type: 'normal',
          }
        }
      })
    })
  })

  return features
})


</script>


