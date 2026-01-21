<script setup>
import { VueFlow } from "@vue-flow/core";
import { Background } from "@vue-flow/background";
import { Controls } from "@vue-flow/controls";
import { MiniMap } from "@vue-flow/minimap";
import { onMounted, ref } from "vue";

import AddNodeEdge from "./AddNodeEdge.vue";
import StartNode from "./Nodes/StartNode.vue";
import TextNode from "./Nodes/TextNode.vue";
import ButtonNode from "./Nodes/ButtonNode.vue";
import CTANode from "./Nodes/CallToActionNode.vue";
import MediaNode from "./Nodes/MediaNode.vue";
import ListNode from "./Nodes/ListNode.vue";
import ContactNode from "./Nodes/ContactNode.vue";
import DelayNode from "./Nodes/DelayNode.vue";
import ConditionNode from "./Nodes/ConditionNode.vue";
import LocationNode from "./Nodes/LocationNode.vue";
import EndNode from "./Nodes/EndNode.vue";

const nodes = ref([]);
const edges = ref([]);

const nodeTypes = {
  start: StartNode,
  text: TextNode,
  button: ButtonNode,
  cta: CTANode,
  media:MediaNode,
  list: ListNode,
  contact: ContactNode,
  delay: DelayNode,
  condition: ConditionNode,
  location: LocationNode,
  end: EndNode,
};

// DELETE NODE
// const deleteNode = (nodeId) => {
//   nodes.value = nodes.value.filter(n => n.id !== nodeId);
// };

const deleteNode = (nodeId) => {
  nodes.value = nodes.value.filter(n => n.id !== nodeId);
  edges.value = edges.value.filter(
    e => e.source !== nodeId && e.target !== nodeId
  );
};

// UPDATE NODE DATA 
const updateNodeData = (nodeId, newData) => {
  nodes.value = nodes.value.map(n =>
    n.id === nodeId
      ? { ...n, data: { ...n.data, ...newData } }
      : n
  );
};

// COPY NODE
const handleCopyNode = ({ id }) => {
  const original = nodes.value.find(n => n.id === id);

  const newNode = {
    ...original,
    id: "node-" + Date.now(),
    position: {
      x: original.position.x + 100,
      y: original.position.y + 80
    },
    data: {
      ...original.data,
      ...sharedNodeActions,
      isPrimary: false,
    }
  };

  nodes.value.push(newNode);
};


const sharedNodeActions = {
  updateNodeData,
  deleteNode,
  copyNode: handleCopyNode,
};

// DROP NEW NODE
const onDrop = (event) => {
  const type = event.dataTransfer.getData("nodeType");

  const baseNode = {
    id: Date.now().toString(),
    type,
    position: { x: event.offsetX, y: event.offsetY },
  };

  if (type === "cta") {
    nodes.value.push({
      ...baseNode,
      data: {
        ...sharedNodeActions,
        header: '',
        valueText: '',
        buttonText: '',
        buttonLink: '',
        footer: ''
      }
    });
    return;
  }
  //for button
  if (type === "button") {
    nodes.value.push({
      ...baseNode,
      data: {
        ...sharedNodeActions,
        message: '',
        buttons: [],
        removeButtonEdges,
      }
    });
    return;
  }

  if (type === "media") {
    nodes.value.push({
      ...baseNode,
      data: {
        ...sharedNodeActions,
        mediaType: 'image',
        mediaUrl: '',
        caption: '',
      }
    });
    return;
  }

  if (type === "list") {
    nodes.value.push({
      ...baseNode,
      data: {
        ...sharedNodeActions,
        title: "",
        body: "",
        footer: "",
        buttonText: "View options",
        sections: [],
        removeButtonEdges,
      },
    });
    return;
  }

  if (type === "delay") {
    nodes.value.push({
      ...baseNode,
      data: {
        ...sharedNodeActions,
        delayValue: 5,
        delayUnit: "minutes",
      },
    });
    return;
  }

  if (type === "condition") {
    nodes.value.push({
      ...baseNode,
      data: {
        ...sharedNodeActions,
        conditions: [],
      },
    });
    return;
  }

  if (type === "location") {
      nodes.value.push({
        ...baseNode,
        data: {
          ...sharedNodeActions,
          latitude: "",
          longitude: "",
          address: ""
        }
      });
      return;
  }
  
  if (type === "end") {
      nodes.value.push({
        ...baseNode,
        data: {
          ...sharedNodeActions,
          isPrimary: false,
        },
      });
      return;
    }


  // Default / text / start nodes
  nodes.value.push({
    ...baseNode,
    data: {
      ...sharedNodeActions,
      keywords: [],
      isPrimary: true
    }
  });
};


const createDefaultStartNode = () => {
  nodes.value = [
    {
      id: "start-" + Date.now(),
      type: "start",
      position: { x: 250, y: 100 },
      data: {
        keywords: ["hello", "hi", "start"],
        isPrimary: true,
        ...sharedNodeActions,
      }
    }
  ];
};

onMounted(() => {
  createDefaultStartNode();
});

// ----- CONNECTION HANDLER -----
const onConnect = (connection) => {

  edges.value.push({
    ...connection,
    id: `edge-${connection.source}-${connection.target}`,
    animated: true,
  });
};

const onEdgesChange = (changes) => {
  changes.forEach(change => {
    if (change.type === 'remove') {
      edges.value = edges.value.filter(e => e.id !== change.item.id);
    }
  });
};

const removeButtonEdges = (nodeId, handleId) => {
  edges.value = edges.value.filter(edge => {
    return !(edge.source === nodeId && edge.sourceHandle === handleId);
  });
};

</script>


<template>
  <div class="h-full w-full border" @drop="onDrop" @dragover.prevent>
    <!-- :edge-types="{ smoothstep: SmoothStepEdge }" -->
    <VueFlow
      v-model:nodes="nodes"
      v-model:edges="edges"
      :node-types="nodeTypes"
      @connect="onConnect"
      @edges-change="onEdgesChange"
      :snap-to-grid="true"
      :select-nodes-on-drag="true"
      :only-render-visible-elements="true"
      :snap-grid="[20, 20]"
      :min-zoom="0.3"
      :max-zoom="2"
      class="h-full"
    >
     
      <template #node="{ node }">
        <component :is="nodeTypes[node.type]" v-bind="node" :edges="edges" />
      </template>
      <Background pattern-color="grey" gap="16" size="1.2" />

      <Controls />

      <MiniMap
        node-color="#f87171"
        mask-color="rgba(0,0,0,0.1)"
      />
    </VueFlow>


  </div>
</template>
