<script setup>
// import { onMounted, reactive, ref } from "vue";
import { onMounted, reactive, ref, computed, watch } from 'vue';
import { VueFlow, useVueFlow } from "@vue-flow/core";
import { usePage } from '@inertiajs/vue3';
import { Background } from "@vue-flow/background";
import { Controls } from "@vue-flow/controls";
import { MiniMap } from "@vue-flow/minimap";
import VueMultiselect from "vue-multiselect";
import boxWithTitleVue from "./components/boxWithTitle.vue";
import boxWithStarter from "./components/boxWithStarter.vue";
import imageContainerVue from "./components/imageContainer.vue";
import boxWitAudioVue from "./components/boxWithAudio.vue";
import boxWitVideoVue from "./components/boxWithVideo.vue";
import boxWithFileVue from "./components/boxWithFile.vue";
import boxTemplate from "./components/boxTemplate.vue";
import boxLocation from "./components/boxWithLocation.vue";
import boxCondition from "./components/boxWithCondition.vue";
import boxWithInteractive from "./components/boxWithInteractive.vue";
import boxWithButton from "./components/boxWithButton.vue";
import globalMenuVue from "./components/globalMenu.vue";
import boxWithInteractiveButton from "./components/boxWithInteractiveButton.vue";
import boxWithInteractiveRow from "./components/boxWithInteractiveRow.vue";
import boxWithInteractiveSection from "./components/boxWithInteractiveSection.vue";
import facebookMessage from "./components/facebookMessage.vue";
import boxFlow from "./components/boxFlow.vue";
import NodeModal from './components/FlowModal.vue'
// Custom Connection line and Custom Edge
import redirectorEdgeVue from "./components/redirectorEdge.vue";
import CustomConnectionLine from "./components/CustomConnectionLine.vue";
import customEdgeVue from "./components/customEdge.vue";
import { createVueNode } from "./utils/createVueNode";
import CustomRangeSlider from "./components/CustomRangeSlider.vue";
////////////////////////////////////////////.
import AppLayout from "./../Layout/App.vue";
import './assets/css/box.css'
import './assets/css/controls_style.css'
import './assets/css/emoji.css'
import './assets/css/flow.css'
import './assets/css/vue-multiselect.css'
import './assets/css/vue-plyr.css'
import './assets/css/theme-default.css'
import './assets/css/core_style.css'
import './assets/css/minimap_style.css'
import './assets/css/style.css'
import axios from 'axios';
// Usage of Store Pinia
import { useStore } from "./stores/main.js";
import globalValue from "./mixins/helper.js";
import getId from "./utils/radomId.js";
const getMixinValue = globalValue();
const store = useStore();
import { useTemplateStore } from './stores/templateStore';
const templateStore = useTemplateStore();
import { useFlowStore } from './stores/FlowStore';
// const selectedTemplate = ref(null);
const searchQuery = ref('');

const isModalOpen = ref(false)

const openNodeModal = () => {
	isModalOpen.value = true
}

const closeModal = () => {
	isModalOpen.value = false
}

const { addEdges, addNodes, onConnect, project, setInteractive, onConnectStart } = useVueFlow();
onConnectStart((event) => {
	let handle_id = event.handleId;
	if (handle_id == "list_messages") {
		let create_event = event.event;
		let btn_node = createVueNode(create_event, addNodes, project, store, "box-with-interactive-button");
		let section_node = createVueNode({ clientX: btn_node.position.x + 800, clientY: btn_node.position.y }, addNodes, project, store, "box-with-interactive-section");
		let row_node_1 = createVueNode({ clientX: section_node.position.x + 800, clientY: section_node.position.y }, addNodes, project, store, "box-with-interactive-row");
		let row_node_2 = createVueNode({ clientX: section_node.position.x + 800, clientY: section_node.position.y + 100 }, addNodes, project, store, "box-with-interactive-row");
		let row_node_3 = createVueNode({ clientX: section_node.position.x + 800, clientY: section_node.position.y + 200 }, addNodes, project, store, "box-with-interactive-row");
		addEdges([{
			animated: false,
			source: event.nodeId,
			sourceHandle: event.handleType,
			target: btn_node.id,
			targetHandle: "left",
			type: "custom",
		}]);
		addEdges([{
			animated: false,
			source: btn_node.id,
			sourceHandle: "source",
			target: section_node.id,
			targetHandle: "left",
			type: "custom",
		}]);
	}
});
const onDragOver = (event) => {
	event.preventDefault();
	if (event.dataTransfer) {
		event.dataTransfer.dropEffect = "move";
	}
};
const onDrop = (event) => {
	createVueNode(event, addNodes, project, store);
};
onConnect((params) => {
	(params.type = "custom"), (params.animated = false);
	addEdges([params]);
});
const onClick = (event) => {
	if (event.node.type == "facebook-message") {
		if (messageToEdit.value == event.node.id) {
			messageToEdit.value = "";
		} else {
			messageToEdit.value = event.node.id;
		}
	}
	store.messageToEdit = messageToEdit.value;
};
let onKeyUp = (event) => {
	switch (event.key) {
		case "AltGraph":
			setInteractive(true);
			break;
		// Close the editor if Escape key is pressed
		case "Escape":
			messageToEdit.value = "";
			break;

		default:
			break;
	}
};

let onKeyDown = (event) => {
	switch (event.key) {
		case "AltGraph":
			setInteractive(false);
			break;

		default:
			break;
	}
};

////////////////////////////////////////////.
// Local variables and props declaration.
let messageToEdit = ref("");
const page = usePage();

const elements = ref([
    ...page.props.nodes,
    ...page.props.edges,
]);
const onChange = (event) => {
	event.forEach((element) => {
		if (element.type == "remove") {
			store.layers.messages = store.layers.messages.filter((item) => {
				return item.id != element.id;
			});
		}
	});
};

const fetchTemplateVariables = () => {
      if (data.template_id) {
        const template = templateStore.templates.find(t => t.id === data.template_id);
        console.log(template?.variables);  // Log the variables for debugging
        data.selectedTemplate = template ? template : null;

        if (data.selectedTemplate) {
          // Initialize template variables dynamically
          data.templateVariables = {};
          Object.keys(data.selectedTemplate.variables).forEach(key => {
            data.templateVariables[key] = {
              matches: {},
              values: {}
            };
            data.selectedTemplate.variables[key].forEach(item => {
              data.templateVariables[key].matches[item.id] = 'input_value';
              data.templateVariables[key].values[item.id] = item.exampleValue || '';
            });
          });
        }
      } else {
        data.selectedTemplate = null;
        data.templateVariables = {};  // Clear template variables when no template is selected
      }
    };

const data = reactive({
	// Basic Fields
	flow_id: '', // Bind this to the select dropdown
	opened: false,
	template_id: "",
	template_variables: {},
	templates: [],
	selectedTemplate: "",
	templateVariables: {},
	fetchTemplateVariables,
	keyword: "",
	matching_types: "",
	text: "",
	description: "",
	text_duration: "",
	current_id: "",
	type: "",
	image: "",
	file_duration: "",
	image_duration: "",
	audio: "",
	audio_duration: "",
	video: "",
	video_duration: "",
	button_duration: "",
	delay: 0.2,
	contact_lists: [],
	segments: [],
	box_title: "",
	match_type: "",
	header_text: "",
	header_media_type: "",
	header_media: "",
	text_message: "",
	footer_text: "",
	button_text: "",
	button_message: "",
	location_duration: 0,
	latitude: "",
	longitude: "",
	address_name: "",
	address: "",
	original_file_name: "",
	file_extension: "",
	searchQuery: '',
	variables: [],
	// Arrays and Objects
	buttons: [],
	items: [
		{ text: '' },
		{ text: '' },
		{ text: '' }
	],
	condition_fields: [
		{
			variable: "",
			operator: "",
			value: "",
		}
	],
	action: [
		{
			button: '',
			sections: {
				title: '',
				rows: [
					{
						id: '',
						title: '',
						description: ''
					}
				]
			}
		}
	],
	condition_variable_options: [
		{ label: "First Name", value: "first_name" },
		{ label: "Last Name", value: "last_name" },
		{ label: "Label", value: "label" },
		{ label: "Email", value: "email" },
		{ label: "Phone Number", value: "phone_number" }
	],
	condition_operator_options: [
		{ label: "=", value: "equal" },
		{ label: "<", value: "less_than" },
		{ label: ">", value: "greater_than" },
		{ label: "≤", value: "less_than_or_equal" },
		{ label: "≥", value: "greater_than_or_equal" },
		{ label: "≠", value: "not_equal" },
		{ label: "Contains", value: "contains" },
		{ label: "Starts With", value: "starts_with" },
		{ label: "Ends With", value: "ends_with" },
		{ label: "Has Value", value: "has_value" }
	],

	// Limits
	limits: {
		headerText: 60,
		buttonMessage: 200,
		footerText: 60,
		buttonText: 20
	},

	// Computed Properties
	headerCharCount: computed(() => data.header_text.length),
	messageCharCount: computed(() => data.text_message.length),
	footerCharCount: computed(() => data.footer_text.length),
	buttonCharCounts: computed(() => data.items.map(item => item.text.length)),
	isHeaderTextInvalid: computed(() => data.header_text.length > data.limits.headerText),
	isButtonMessageInvalid: computed(() => data.text_message.length > data.limits.buttonMessage),
	isFooterTextInvalid: computed(() => data.footer_text.length > data.limits.footerText),
	isButtonTextInvalid: (index) => data.items[index]?.text.length > data.limits.buttonText,



	// Methods for Validations
	validateHeaderText() {
		this.header_text = this.header_text.slice(0, this.limits.headerText);
	},
	validateButtonMessage() {
		this.text_message = this.text_message.slice(0, this.limits.buttonMessage);
	},
	validateFooterText() {
		this.footer_text = this.footer_text.slice(0, this.limits.footerText);
	},
	validateButtonText(index) {
		if (index >= 0 && index < this.items.length) {
			this.items[index].text = this.items[index].text.slice(0, this.limits.buttonText);
		}
	},
	handleInput(event, index) {
		if (index >= 0 && index < this.items.length) {
			this.items[index].text = event.target.value.slice(0, this.limits.buttonText);
		}
	}
});

// const fetchTemplateVariables = () => {
//   if (data.template_id) {
//     const template = templateStore.templates.find(t => t.id === data.template_id);
// 	console.log(template.variables);
//     data.selectedTemplate = template ? template : null;
//   } else {
//     data.selectedTemplate.value = null;
//   }
// };



// Filter out undefined variables for safety and display purposes
const displayedVariables = computed(() => {
  if (data.selectedTemplate) {
    return Object.entries(data.selectedTemplate.variables || {})
      .filter(([_, variable]) => variable !== undefined);
  }
  return [];
});
// Function to add a new section
function addSection() {
	if (!Array.isArray(data.action.sections)) {
		data.action.sections = [];
	}
	if (data.action.sections.length < 3) {
		data.action.sections.push({
			title: '',
			rows: [
				{
					id: '',
					title: '',
					description: ''
				}
			]
		});
	}
}

function removeSection(index) {
	data.action.sections.splice(index, 1);
}

function addSectionRow(sectionIndex) {
	if (data.action.sections[sectionIndex].rows.length < 3) {
		data.action.sections[sectionIndex].rows.push({
			id: '',
			title: '',
			description: ''
		});
	}
}

function removeSectionRow(sectionIndex, rowIndex) {
	data.action.sections[sectionIndex].rows.splice(rowIndex, 1);
}

function handleData(args) {
	let localStates = args.args.value;
	data.type = localStates.type;
	data.current_id = localStates.id;
	data.box_title = localStates.title;
	if (data.type == "starter-box") {
		data.keyword = localStates.keyword;
		data.matching_types = localStates.matching_types;
	}
	else if (data.type == "box-with-title") {
		data.text = localStates.text;
		data.text_duration = localStates.text_duration;
	}
	else if (data.type == "node-image") {
		data.image = localStates.image;
		data.image_duration = localStates.image_duration;
	}
	else if (data.type == "box-with-audio") {
		data.audio = localStates.audio;
		data.audio_duration = localStates.audio_duration;
		const audio_element = document.getElementById("audio");
		if (audio_element) {
			audio_element.src = data.audio;
		}
	} else if (data.type == "box-with-video") {
		data.video = localStates.video;
		data.video_duration = localStates.video_duration;
		const video_element = document.getElementById("video");
		if (video_element) {
			video_element.src = data.video;
		}
	} else if (data.type == "box-with-file") {
		data.file = localStates.file;
		data.file_duration = localStates.file_duration;
	} else if (data.type == "box-with-location") {

		data.latitude = localStates.latitude;
		data.longitude = localStates.longitude;
		data.location_duration = localStates.location_duration;
		data.address_name = localStates.address_name;
		data.address = localStates.address;

	} else if (data.type == "box-with-template") {
		data.template_id = localStates.template_id;
	} else if (data.type == "box-with-condition") {
		data.match_type = localStates.match_type;
		data.condition_fields = localStates.condition_fields;
	} else if (data.type == "box-with-list") {
		data.header_type = localStates.header_type;
		data.header_media_type = localStates.header_media_type;
		data.header_media = localStates.header_media;
		data.text_message = localStates.text_message;
		// data.action = localStates.action;
	}
	else if (data.type == "box-with-button") {
		data.items = localStates.items;
		data.button_duration = localStates.button_duration;
		data.button_message = localStates.button_message;
		data.duration = localStates.duration;
		data.header_text = localStates.header_text;
		data.footer_text = localStates.footer_text;
	}
	else if (data.type == "box-with-flow") {
		data.flow_id 	= localStates.flow_id;
		data.flow_name 		= localStates.flow_name;
		data.duration 	= localStates.duration;
	}

	openNodeModal();
}

async function handleFile(event, type) {
	let file = event.target.files[0];
	await uploadFile(file, type);
}

async function uploadFile(file, type) {
	let config = {
		headers: {
			"Content-Type": "multipart/form-data; charset=utf-8; boundary=" + Math.random().toString().substr(2),
			"X-CSRF-TOKEN": document.querySelector('meta[name="csrf-token"]').getAttribute("content"),
		},
	};
	let form_data = new FormData();
	form_data.append("file", file);
	form_data.append("id", data.current_id);
	form_data.append("type", data.type);
	let url = getMixinValue.getUrl("upload-files");
	await axios
		.post(url, form_data, config)
		.then((response) => {
			if (type == "audio") {
				data.audio = response.data.file_object.file;
				const audio_element = document.getElementById("audio");
				const audio_container = document.getElementById("audio_container");
				audio_element.src = response.data.file_object.file;
				audio_container.src = response.data.file_object.file;
			} else if (type == "video") {
				data.video = response.data.file_object.file;
				const video_element = document.getElementById("video");
				const video_container = document.getElementById("video_container");
				video_element.src = response.data.file_object.file;
				video_container.src = response.data.file_object.file;
			} else {
				data[type] = response.data.file_object.file;
				data.file_extension = response.data.file_object.ext;
				console.log(response.data.file_object.ext);
			}
		})
		.catch((error) => { });
}
function addRow() {
	data.condition_fields.push({
		variable: "",
		operator: "",
		value: "",
	});
}
function removeRow() {
	data.condition_fields.pop();
}

function addButton() {
	if (!Array.isArray(data.buttons)) {
		data.buttons = []; // Initialize as an empty array if not already an array
	}
	if (data.buttons.length < 2) {
		data.buttons.push({ text: '' }); // Add a new button object with empty text
	}
}

// Method to remove a button from data.buttons array
function removeButton(index) {
	data.buttons.splice(index, 1); // Remove button at specified index
}
onMounted(() => {
	templateStore.fetchTemplates();
	fetchFlows();
});
const searchTemplates = () => {
	templateStore.searchTemplates(data.searchQuery);
};
const loadMoreTemplates = () => {
	templateStore.loadMoreTemplates();
};
const canLoadMore = computed(() => templateStore.currentPage < templateStore.lastPage);
// Set up the Flow Store
const flowStore = useFlowStore();
// Computed properties for state and getters from the store
const flows = computed(() => flowStore.allFlows);

const isLoading = computed(() => flowStore.isLoading);
const pagination = computed(() => flowStore.pagination);

// Fetch initial flow data when component is created
const fetchFlows = () => {
  flowStore.fetchFlows({ page: pagination.value.currentPage, searchQuery: searchQuery.value });
};
const onSearch = () => {
  flowStore.setSearchQuery(searchQuery.value);
  fetchFlows();
};
// Pagination controls
const prevPage = () => {
  if (pagination.value.currentPage > 1) {
    flowStore.setCurrentPage(pagination.value.currentPage - 1);
    fetchFlows();
  }
};
const nextPage = () => {
  if (pagination.value.currentPage < pagination.value.totalPages) {
    flowStore.setCurrentPage(pagination.value.currentPage + 1);
    fetchFlows();
  }
};

</script>
<template>
	<AppLayout>
	<div class="bg-black md:bg-inherit pt-10 px-4 md:pt-8 md:p-8 rounded-[5px] text-[#000] h-full md:overflow-y-auto">

		<div class="flex justify-between">
        <div>
            <h2 class="text-xl mb-1">{{ $t('Create Flow') }}</h2>
            <p class="mb-6 flex items-center text-sm leading-6 text-gray-600">
                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="18" viewBox="0 0 24 24"><path fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 11v5m0 5a9 9 0 1 1 0-18a9 9 0 0 1 0 18Zm.05-13v.1h-.1V8h.1Z"/></svg>
                <span class="ml-1 mt-1">{{ $t('Create flow automation using your own criteria') }}</span>
            </p>
        </div>
        <div>
            <Link href="/automation/flows" class="flex items-center space-x-4 rounded-md bg-indigo-600 px-3 py-2 text-sm text-white shadow-sm hover:bg-indigo-500 focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600">
                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16"><path fill="currentColor" fill-rule="evenodd" d="M5.841 5.28a.75.75 0 0 0-1.06-1.06L1.53 7.47L1 8l.53.53l3.25 3.25a.75.75 0 0 0 1.061-1.06l-1.97-1.97H24.25a.75.75 0 0 0 0-1.5H3.871l1.97-1.97Z" clip-rule="evenodd"/></svg>
                {{ $t('Back') }}
            </Link>
        </div>
    </div>

		
		<div id="allTheNav">
			<div class="flowBuilder__inner d-flex" style="height: 84vh">
				<globalMenuVue></globalMenuVue>
				<div class="m-1 border" id="vue_flow" oncontextmenu="return false;" style="position: relative">
					<VueFlow v-model="elements" class="customnodeflow" :snap-to-grid="true" :select-nodes-on-drag="true"
						:only-render-visible-elements="true" :default-viewport="{ zoom: 0.5 }" :max-zoom="50"
						:min-zoom="0.05" @dragover="onDragOver" @drop="onDrop" @nodeDoubleClick="onClick"
						@nodesChange="onChange">
						<Background pattern-color="grey" gap="16" size="1.2" />
						<template #connection-line="{ sourceX, sourceY, targetX, targetY }">
							<CustomConnectionLine :source-x="sourceX" :source-y="sourceY" :target-x="targetX"
								:target-y="targetY" />
						</template>
						<template #edge-custom="props">
							<customEdgeVue v-bind="props" />
						</template>
						<template #node-redirector="props">
							<redirectorEdgeVue v-bind="props" />
						</template>
						<template #node-starter-box="props">
							<boxWithStarter @data-sent="handleData" :id="props.id" :text="data.text"
								:selected="props.selected" :keyword="data.keyword" :matching_types="data.matching_types"
								:current_id="data.current_id" />
						</template>
						<template #node-box-with-title="props">
							<boxWithTitleVue @data-sent="handleData" :id="props.id" :selected="props.selected"
								:text_duration="data.text_duration" :text="data.text" :current_id="data.current_id" />
						</template>
						<template #node-node-image="props">
							<imageContainerVue @data-sent="handleData" :id="props.id" :selected="props.selected"
								:duration="data.image_duration" :image="data.image" :current_id="data.current_id" />
						</template>
						<template #node-box-with-audio="props">
							<boxWitAudioVue @data-sent="handleData" :id="props.id" :selected="props.selected"
								:duration="data.audio_duration" :audio="data.audio" :current_id="data.current_id" />
						</template>
						<template #node-box-with-video="props">
							<boxWitVideoVue @data-sent="handleData" :id="props.id" :selected="props.selected"
								:duration="data.video_duration" :video="data.video" :current_id="data.current_id" />
						</template>
						<template #node-box-with-button="props">
							<boxWithButton @data-sent="handleData" :id="props.id" :selected="props.selected"
								:header_text="data.header_text" :footer_text="data.footer_text"
								:button_duration="data.button_duration" :items="data.items" :button_message="data.button_message"
								:current_id="data.current_id" />
						</template>
						<template #node-box-with-file="props">
							<boxWithFileVue @data-sent="handleData" :id="props.id" :selected="props.selected"
								:duration="data.file_duration" :file="data.file" :extension="data.file_extension"
								:current_id="data.current_id" />
						</template>

						<template #node-box-with-location="props">
							<boxLocation @data-sent="handleData" :id="props.id" :selected="props.selected"
								:location_duration="data.location_duration" 
								:address_name="data.address_name" 
								:address="data.address" 
								:latitude="data.latitude" 
								:longitude="data.longitude"
								:current_id="data.current_id" />
						</template>
						<template #node-box-with-template="props">
							<boxTemplate @data-sent="handleData" :id="props.id" :selected="props.selected"
								:template_id="data.template_id" :template_variables="data.template_variables"
								:current_id="data.current_id" />
						</template>
						<template #node-box-with-flow="props">
							<boxFlow @data-sent="handleData" :id="props.id" :selected="props.selected"
								:flow_id="data.flow_id"
								:flow_name="data.flow_name"
								:current_id="data.current_id" />
						</template>
						<template #node-box-with-condition="props">
							<boxCondition @data-sent="handleData" :id="props.id" :selected="props.selected"
								:current_id="data.current_id" :match_type="data.match_type"
								:condition_fields="data.condition_fields" />
						</template>

						<template #node-box-with-list="props">
							<boxWithInteractive @data-sent="handleData" :id="props.id" :duration="data.duration"
								:selected="props.selected"
								:header_type="data.header_type" :header_media="data.header_media"
								:text_message="data.text_message" :footer_text="data.footer_text"
								:button_text="data.button_text" :current_id="data.current_id" />
						</template>
						<Controls />
						<MiniMap v-show="messageToEdit === ''" />
					</VueFlow>
				</div>
			</div>
		</div>
	</div>
	<NodeModal :isOpen="isModalOpen" label="Configure Node" @close="closeModal">
	<!-- Dynamic node content -->
	<div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasRight" aria-labelledby="offcanvasRightLabel">
			<!-- <div class="offcanvas-header">
				<h5 class="offcanvas-title" id="offcanvasRightLabel">
					{{ $t('configure') }} <span>{{ data.box_title }}</span>
				</h5>
				<button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
			</div> -->
			<div class="offcanvas-body !p-0">
				<div v-if="data.type == 'starter-box'">
					<div class="trigger-trigger-keyword-group trigger-onDemand-field mb-3 text-left mt-2">
						<label for="trigger-trigger-keyword">
							{{ $t('write_down_the_keywords') }}
						</label>
						<input type="text" class="form-control w-full mt-2" id="trigger-trigger-keyword"
							aria-describedby="trigger-trigger-keyword-help"
							:placeholder="$t('hello_hi_start')" v-model="data.keyword" />
					</div>
					<div class="card_content">
						<div class="mb-3">
							<label for="matching_type" class="d-block !text-[16px] !mb-2">{{ $t('matching_type') }}<span
									class="text-danger">*</span></label>
							<div class="flex_input !p-0" style="border: none;">
								<div class="inline-flex items-center">
							    <label class="relative flex items-center cursor-pointer">
							      <input type="radio" class="peer h-5 w-5 cursor-pointer appearance-none rounded-full border border-slate-300 checked:border-slate-400 transition-all" name="matching_types" id="exacts" value="exacts"
																	v-model="data.matching_types" checked>
							      <span class="absolute bg-slate-800 w-3 h-3 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-[42%] left-1/2 transform -translate-x-1/2 -translate-y-1/2">
							      </span>
							    </label>
							    <label class="ml-2 text-slate-600 cursor-pointer text-sm !mb-3" for="exacts">	{{ $t('exact_keyword_match') }}</label>
							  </div>
								<div class="inline-flex items-center">
							    <label class="relative flex items-center cursor-pointer" for="html">
							      <input type="radio" class="peer h-5 w-5 cursor-pointer appearance-none rounded-full border border-slate-300 checked:border-slate-400 transition-all" name="matching_types" id="contains" value="contains"
										v-model="data.matching_types">
							      <span class="absolute bg-slate-800 w-3 h-3 rounded-full opacity-0 peer-checked:opacity-100 transition-opacity duration-200 top-[42%] left-1/2 transform -translate-x-1/2 -translate-y-1/2">
							      </span>
							    </label>
							    <label class="ml-2 text-slate-600 cursor-pointer text-sm !mb-3" for="contains">{{ $t('contain') }}</label>
							  </div>



							</div>
						</div>
					</div>
				</div>
				<div v-if="data.type == 'box-with-title'">
					<div class="mb-3">
						<label for="">{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
						<input type="number" class="form-control w-full mt-2" :placeholder="$t('e_g_10')"
							v-model="data.text_duration" min="1" max="60" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('text_message') }}</label>
						<textarea name="" class="form-control w-full mt-2" id="" :placeholder="$t('text_message')"
							v-model="data.text"></textarea>
						<small class="d-block">{{ $t('dynamic_variables') }}    
							<italic v-html="'&#123;{name}&#125;, &#123;{phone}&#125;'"></italic>
						</small>
					</div>
				</div>
				<div v-else-if="data.type == 'node-image'">
					<div class="mb-3">
						<label for="">{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
						<input type="number" class="form-control w-full mt-2" :placeholder="$t('e_g_10')"
							v-model="data.image_duration" min="1" max="60" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('image') }}</label>
						<div class="">
							<input type="file" accept="image/*" class="form-control w-full mt-2"
								@change="handleFile($event, 'image')" />
						</div>
						<div>
							<img :src="data.image" class="image" />
						</div>
					</div>
				</div>
				<div v-else-if="data.type == 'box-with-audio'">
					<div class="mb-3">
						<label for="">{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
						<input type="number" class="form-control w-full mt-2" placeholder="{{ $t('e_g_10') }}"
							v-model="data.audio_duration" min="1" max="60" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('audio') }}</label>
						<div class="">
							<input type="file" accept="audio/*" class="form-control w-full mt-2"
								@change="handleFile($event, 'audio')" />
						</div>
						<div style="margin-top: 20px" v-if="data.audio">
							<p style="margin: 0">{{ $t('preview') }}</p>
							<vue-plyr>
								<audio id="audio">
									<source :src="data.audio" type="audio/mp3" />
								</audio>
							</vue-plyr>
						</div>
					</div>
				</div>
				<div v-else-if="data.type == 'box-with-video'">
					<div class="mb-3">
						<label for="">{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
						<input type="number" class="form-control w-full mt-2" :placeholder="$t('e_g_10')"
							v-model="data.video_duration" min="1" max="60" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('video') }}</label>
						<div class="">
							<input type="file" accept="video/*" class="form-control w-full mt-2"
								@change="handleFile($event, 'video')" />
						</div>
						<div style="margin-top: 20px" v-if="data.video">
							<p style="margin: 0">{{ $t('preview') }}</p>
							<vue-plyr>
								<video id="video">
									<source :src="data.video" type="video/mp4" />
								</video>
							</vue-plyr>
						</div>
					</div>
				</div>
				<div v-else-if="data.type == 'box-with-file'">
					<div class="mb-3">
						<label for="">{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
						<input type="number" class="form-control w-full mt-2" :placeholder="$t('e_g_10')"
							v-model="data.file_duration" min="1" max="60" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('file') }}</label>
						<div class="">
							<input type="file" class="form-control w-full mt-2" accept=".pdf"
								@change="handleFile($event, 'file')" />
						</div>
						<div style="margin-top: 20px" v-if="data.file">
							<p style="margin: 0">{{ $t('preview') }}</p>
							<iframe id="iframe" :src="data.file"></iframe>
						</div>
					</div>
				</div>
				<div v-if="data.type == 'box-with-list'">
					<div class="">
						<div class="mb-3">
							<label>{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
							<input type="number" class="form-control" :placeholder="$t('e_g_10')"
								v-model="data.interactive_duration" min="1" max="60">
						</div>

						<div class="mb-3">
							<label>{{ $t('message_body') }}</label>
							<textarea class="form-control" :placeholder="$t('message_body')"
								v-model="data.text_message"></textarea>
						</div>

						<div class="mb-3">
							<label>{{ $t('button_text') }}</label>
							<input type="text" class="form-control" v-model="data.button_text"
								:placeholder="$t('button_text')">
						</div>
						<div class="border-bottoms">{{ $t('action') }}</div>
						<div class="button__wrapper-bg">
							<div class="button__group">
								<!-- <legend>{{ $t('buttons') }}</legend> -->
								<div v-for="(section, sIndex) in data.action.sections" :key="sIndex" class="mb-4">
									<div class="mb-3">
										<label>{{ $t('section_title') }}</label>
										<input type="text" class="form-control" v-model="section.title"
											:placeholder="$t('section_title')">
									</div>
									<div v-for="(row, rIndex) in section.rows" :key="rIndex">
										<div class="button__grid">
											<div class="mb-3">
												<label>{{ $t('row_title') }}</label>
												<input type="text" class="form-control" v-model="row.title"
													:placeholder="$t('row_title')">
											</div>
											<div class="mb-3">
												<label>{{ $t('row_description') }}</label>
												<input type="text" class="form-control" v-model="row.description"
													:placeholder="$t('row_description')">
											</div>
											<button class="btn btn-primary" style="margin-bottom: 10px;"
												@click="removeSectionRow(sIndex, rIndex)">Remove Row</button>
										</div>
									</div>
									<div class="btn__groups">
										<button class="btn btn-primary" @click="addSectionRow(sIndex)">Add Row</button>
										<button class="btn btn-primary" @click="removeSection(sIndex)">Remove
											Section</button>
									</div>
								</div>
							</div>
							<button class="btn btn-primary custom__btn" @click="addSection">Add Section</button>
						</div>
					</div>
				</div>

				<div v-else-if="data.type == 'box-with-button'">
					<!-- Header Text Input -->

					<div class="mb-3">
							<label>{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
							<input type="number" class="form-control w-full mt-2" :placeholder="$t('e_g_10')"
								v-model="data.button_duration" min="1" max="60">
						</div>

					<div class="mb-3">
						<label>
							{{ $t('header_text') }}
							<span v-if="$t('optional')">({{ $t('optional') }})</span>
						</label>
						<input class="form-control w-full mt-2" v-model="data.header_text"
							:class="{ 'is-invalid': data.isHeaderTextInvalid }" @input="data.validateHeaderText"
							placeholder="Header Text" :maxlength="data.limits.headerText" />
						<small id="headerCharCount" class="text-muted">
							{{ $t('max_characters') }}: {{ data.limits.headerText }}
							<span :class="{ 'text-danger': data.headerCharCount > data.limits.headerText }">
								({{ data.headerCharCount }} / {{ data.limits.headerText }})
							</span>
						</small>
					</div>

					<!-- Button Message Textarea -->
					<div class="mb-3">
						<label>{{ $t('button_message') }}</label>
						<textarea name="message" class="form-control" id="message" v-model="data.button_message"
							:placeholder="$t('button_message')"
							:class="{ 'is-invalid': data.isButtonMessageInvalid }" @input="data.validateButtonMessage"
							:maxlength="data.limits.buttonMessage"></textarea>
						<small id="messageCharCount" class="text-muted text-alert">
							{{ $t('max_characters') }}: {{ data.limits.buttonMessage }}
							<span :class="{ 'text-danger': data.buttonMessageCharCount > data.limits.buttonMessage }">
								({{ data.buttonMessageCharCount }} / {{ data.limits.buttonMessage }})
							</span>
						</small>
					</div>
					<!-- Buttons Grid -->
					<div class="button__wrapper">
						<div class="button__group">
							<legend>{{ $t('buttons') }}</legend>
							<div class="button__grid">
								<div v-for="(button, index) in data.items" :key="index" class="mb-3">
									<label>{{ getMixinValue.lang['button' + (index + 1) + '_text'] }}</label>
									<input type="text" class="form-control w-full mt-2"
										:placeholder="$t('button_text')"
										@input="data.handleInput($event, index)" v-model="button.text"
										:class="{ 'is-invalid': data.isButtonTextInvalid(index) }"
										:maxlength="data.limits.buttonText" />
									<small id="buttonCharCount{{ index }}" class="text-muted">
										{{ $t('max_characters') }}: {{ data.limits.buttonText }}
										<span
											:class="{ 'text-danger': data.items[index].text.length > data.limits.buttonText }">
											({{ data.items[index].text.length }} / {{ data.limits.buttonText }})
										</span>
									</small>
								</div>
							</div>
						</div>
					</div>
					<!-- Footer Text Input -->
					<div class="mb-3">
						<label>
							{{ $t('footer_text') }}
							<span v-if="$t('optional')">({{ $t('optional') }})</span>
						</label>
						<input type="text" class="form-control w-full mt-2" :placeholder="$t('footer_text')"
							v-model="data.footer_text" :class="{ 'is-invalid': data.isFooterTextInvalid }"
							@input="data.validateFooterText" :maxlength="data.limits.footerText" />
						<small id="footerCharCount" class="text-muted">
							{{ $t('max_characters') }}: {{ data.limits.footerText }}
							<span :class="{ 'text-danger': data.footerCharCount > data.limits.footerText }">
								({{ data.footerCharCount }} / {{ data.limits.footerText }})
							</span>
						</small>
					</div>
				</div>
				<div v-else-if="data.type == 'box-with-location'">
					<div class="mb-3">
						<label for="">{{ $t('delay_in_reply') }} ({{ $t('in_sec') }})</label>
						<input type="number" class="form-control w-full mt-2" :placeholder="$t('e_g_10')"
							v-model="data.location_duration" min="1" max="60" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('address_name') }}</label>
						<input type="text" v-model="data.address_name" class="form-control w-full mt-2"
							:placeholder="$t('address_name')" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('address') }}</label>
						<textarea class="form-control w-full mt-2" v-model="data.address" name="" id="" rows="3"
							:placeholder="$t('address')"></textarea>
					</div>
					<div class="mb-3">
						<label for="">{{ $t('latitude') }}</label>
						<input type="text" v-model="data.latitude" class="form-control w-full mt-2"
							:placeholder="$t('latitude')" />
					</div>
					<div class="mb-3">
						<label for="">{{ $t('longitude') }}</label>
						<input type="text" v-model="data.longitude" class="form-control w-full mt-2"
							:placeholder="$t('longitude')" />
					</div>
				</div>

				<div v-else-if="data.type == 'box-with-condition'">
					<label>{{ $t('match_type') }}</label>
					<VueMultiselect v-model="data.match_type" label="label" track-by="value" :options="[
						{ value: 'all_match', label: 'All Match' },
						{ value: 'any_match', label: 'Any Match' },
					]">
					</VueMultiselect>
					<div>
						<p class="mt-3 mb-1">{{ $t('fields') }}</p>
						<div class="flex_input" v-for="(field, index) in data.condition_fields" :key="index">
							<div class="mb-3">
								<label for="">{{ $t('variable') }}</label>
								<VueMultiselect v-model="field.variable" label="label" track-by="value"
									:options="data.condition_variable_options"> </VueMultiselect>
							</div>
							<div class="mb-3">
								<label for="">{{ $t('operator') }}</label>
								<VueMultiselect v-model="field.operator" label="label" track-by="value"
									:options="data.condition_operator_options"> </VueMultiselect>
							</div>
							<div class="mb-3">
								<label for="">{{ $t('value') }}</label>
								<input type="text" class="form-control" v-model="field.value" />
							</div>
							<div class="mb-3">
								<label for="">{{ $t('action') }}</label>
								<div class="action_btn">
									<a v-if="index > 0" href="javascript:void(0)" @click="removeRow"><i
											class="las la-minus"></i></a>
									<a v-else href="javascript:void(0)" @click="addRow"><i class="las la-plus"></i></a>
								</div>
							</div>
						</div>
					</div>

					<!-- <table class="table table-bordered">
						<thead>
							<tr>
								<th>{{ $t('variable') }}</th>
								<th>{{ $t('operator') }}</th>
								<th>{{ $t('value') }}</th>
								<th>{{ $t('action') }}</th>
							</tr>
						</thead>
						<tbody>
							<tr v-for="(field, index) in data.condition_fields" :key="index">
								<td>
									<VueMultiselect v-model="field.variable" label="label" track-by="value"
										:options="data.condition_variable_options"> </VueMultiselect>
								</td>
								<td>
									<VueMultiselect v-model="field.operator" label="label" track-by="value"
										:options="data.condition_operator_options"> </VueMultiselect>
								</td>
								<td>
									<input type="text" class="form-control" v-model="field.value" />
								</td>
								<td>
									<a v-if="index > 0" href="javascript:void(0)" @click="removeRow"><i
											class="las la-minus"></i></a>
									<a v-else href="javascript:void(0)" @click="addRow"><i class="las la-plus"></i></a>
								</td>
							</tr>
						</tbody>
					</table> -->
				</div>
				<div class="form-group" v-else-if="data.type == 'box-with-template'">
					<label>{{ $t('template') }}</label>
					<select class="form-control" v-model="data.template_id" @change="fetchTemplateVariables">
						<option value="">Select Template</option>
						<option v-for="(template, index) in templateStore.templates" :key="index" :value="template.id">
							{{ template.category }} => {{ template.name }}
						</option>
					</select>
					<!-- Display the template variables -->
					<div class="my-2 mt-3" v-if="data.selectedTemplate && data.selectedTemplate.variables">
						<div v-for="(variable, key) in data.selectedTemplate.variables" :key="key">
							<h6 v-if="variable[0]" class="v-section-title border-bottom pb-2 text-capitalize">{{ key }}</h6>
							<div v-for="(item, itemKey) in variable" :key="itemKey" class="row">

								<div class="col-sm-6 mb-3 match-value-select">

									<label class="form-label"> 
										{{ $t('match_value') }}
									</label>
									<select :name="`${key}_matchs[${item.id}]`" v-model="data.templateVariables[key].matches[item.id]"  class="form-control form-select body-match-select">
										<option value="input_value">
											{{ $t('use_input_value') }}
											</option>
										<option value="contact_name">
											{{ $t('contact_name') }}
											</option>
										<option value="contact_phone">
											{{ $t('contact_phone') }}
											</option>
									</select>
									
								</div>

								<div class="col-sm-6 mb-3 body-value-input">

									<label class="form-label" :for="`${key}_${item.id}`">
										{{ $t('variable') }}
										{{ item.id }}
									</label>
									<input type="text" class="form-control live_preview"
										:data-target="`.${key}_${item.id}`" :id="`${key}_${item.id}`"
										:name="`${key}_values[${item.id}]`" :placeholder="item.exampleValue"
										:value="item.exampleValue" v-model="data.templateVariables[key].values[item.id]" />

								</div>

							</div>

							<div v-if="key === 'document'" class="row">
								<div class="col-12 mb-3">
									<label class="form-label" for="document">
										{{ $t('document') }}
										</label>
									<input type="file" id="document" class="form-control boot-file-input"
										name="document" accept="application/pdf" required />
								</div>
							</div>

							<div v-if="key === 'image'" class="row">
								<div class="col-12 mb-3">
									<label class="form-label" for="header_image">
										{{ $t('header_image') }}
										</label>
									<input type="file" id="header_image"
										class="form-control boot-file-input header_file" name="image" accept="image/*"
										required />
								</div>
							</div>

							<div v-if="key === 'video'" class="row">
								<div class="col-12 mb-3">
									<label class="form-label" for="video">
										{{ $t('video') }}
										</label>
									<input type="file" id="video" class="form-control boot-file-input" name="video"
										accept="video/mp4,video/x-m4v,video/*" required />
								</div>
							</div>

							<div v-if="key === 'buttons'">
								<div v-for="button in variable" :key="button.id">
									<div v-for="buttonItem in button" :key="buttonItem.id">
										<div v-if="buttonItem.type === 'URL'" class="row">
											<div class="col-6 mb-3 match-value-select">
												<label class="form-label">
													{{ $t('match_value') }}
													</label>
												<select :name="`button_matchs[${buttonItem.id}]`"
													class="form-control form-select body-match-select">
													<option value="input_value">
														{{ $t('use_input_value') }}
														</option>
													<option value="contact_name">
														{{ $t('contact_name') }}
														</option>
													<option value="contact_phone">
														{{ $t('contact_phone') }}
														</option>
												</select>
											</div>
											<div class="col-6 mb-3 body-value-input">
												<label class="form-label" :for="`button_${buttonItem.id}`">
													{{ $t('variable') }}
												
													</label>
												<input type="text" class="form-control live_preview"
													:data-target="`.button_${buttonItem.id}`"
													:id="`button_${buttonItem.id}`"
													:name="`button_values[${buttonItem.id}]`"
													:placeholder="buttonItem.exampleValue"
													:value="buttonItem.exampleValue" />
											</div>
										</div>
										<!-- Add additional cases for other button types if needed -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="form-group" v-else-if="data.type == 'box-with-flow'">
					<label>{{ $t('flow') }}</label>
					<select class="form-control" v-model="data.flow_id">
					<option value="">Select flow</option>
					<option v-for="(flow, index) in flows" :key="index" :value="flow.id">
						{{ flow.name }}
					</option>
					</select>
					
				</div>
			</div>
			<!-- <div class="offcanvas-footer">
				<div class="offcanvas-button">
					<button @close="closeModal" class="btn sg-btn-primary w-100">{{ $t('done')
						}}</button>
				</div>
			</div> -->
		</div>
</NodeModal>
	</AppLayout>
</template>

