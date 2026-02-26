<template>
<!-- 
<div class="bg-white border rounded-lg p-4">

    <div class="flex mb-4">

        <div>
            <h4>Knowledge Base</h4>
            <div class="text-slate-500">
                Upload documents for AI
            </div>
        </div>

        <button
            @click="$emit('upload')"
            class="ml-auto bg-primary text-white px-3 h-8 rounded"
        >
            Upload Documents
        </button>

    </div>

    <AiTable :rows="props.rows" :filters="props.filters"/>

</div> -->

<div class="bg-white border border-slate-200 rounded-lg py-2 text-sm mb-20 pb-4 px-4">
   <div class="w-full py-2 mb-4 mt-2">
      <div class="flex w-full mb-4">
         <div class="text-md w-[70%]">
            <h4 class="text-[16px]">{{$t('Knowledge Base')}}</h4>
            <span class="flex items-center mt-1 text-slate-500">{{$t('Enhance your AI assistant by uploading information to improve client interactions.')}}</span>
         </div>
         <div class="ml-auto w-[40%]">
            <div  @click="$emit('upload')" class="float-right flex items-center gap-x-2"><button class="rounded-md px-3 h-8 text-[13px] text-white shadow-sm focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 bg-primary hover:bg-black">{{$t('Upload Documents')}}</button></div>
         </div>
      </div>
      <AiTable :rows="props.rows" :filters="props.filters"/>
   </div>
</div>


</template>

<script setup>

import AiTable from './AiTable.vue'

const props = defineProps(['rows', 'filters']);

</script>
