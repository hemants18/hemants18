<template>
	<div class="bg-white border border-slate-200 rounded-lg pt-2 text-sm mb-4 px-4 mb-20">
	    <div class="w-full py-2 mb-4 mt-2">

	        <div class="flex w-full">
	            <div class="text-md">
	                <h4 class="text-[16px]">{{$t('Enable AI Assistant')}}</h4>
	                <div class="mb-1 text-slate-500">{{$t('Activate AI-generated responses in your conversations')}}</div>
	            </div>

		        <div class="ml-auto">
		        	<div class="flex items-center gap-x-3">
		            	<!-- <FormToggleSwitch v-model="localEnabled" /> -->
		            	<div class="w-12 h-6 flex items-center bg-gray-300 rounded-full p-1" :class="{ 'bg-primary': props.enabled}" @click="update(enabled)">
                            <div class="bg-white w-4 h-4 rounded-full shadow-md transform duration-300 ease-in-out" :class="{ 'translate-x-6': props.enabled}"></div>
                        </div>
		            	
		            	<!-- <div> | </div>

		            	<button @click="update" class="bg-primary text-white h-8 rounded-lg text-[13px] px-3 w-fit">{{$t('Update')}}</button> -->
		        	</div>
		        </div>
	        </div>
	    </div>
	</div>
</template>

<script setup>

import { ref, watch } from 'vue'
import FormToggleSwitch from '@/Components/FormToggleSwitch.vue'

const props = defineProps({
    enabled: Boolean
})

const emit = defineEmits(['update'])

const localEnabled = ref(props.enabled)

function update()
{
    emit('update', localEnabled.value)
}

</script>
