<script setup>
import { Handle, Position } from "@vue-flow/core";
import { computed, ref } from "vue";

const props = defineProps({
  id: String,
  data: {
    type: Object,
    required: true,
  },
});

/* ---------------- LIST MESSAGE DATA ---------------- */

const title = computed({
  get: () => props.data.title || "",
  set: (val) => {
    props.data.updateNodeData(props.id, { title: val });
  },
});

const body = computed({
  get: () => props.data.body || "",
  set: (val) => {
    props.data.updateNodeData(props.id, { body: val });
  },
});

const footer = computed({
  get: () => props.data.footer || "",
  set: (val) => {
    props.data.updateNodeData(props.id, { footer: val });
  },
});

const buttonText = computed({
  get: () => props.data.buttonText || "View options",
  set: (val) => {
    props.data.updateNodeData(props.id, { buttonText: val });
  },
});

/* ===========================
   DYNAMIC SECTIONS + ROWS
=========================== */

const sections = computed(() => props.data.sections || []);

/* Add new section */
const addSection = () => {
  props.data.updateNodeData(props.id, {
    sections: [
      ...sections.value,
      {
        title: "New Section",
        rows: [],
      },
    ],
  });
};

/* Remove section */
const removeSection = (sIndex) => {
  const updated = [...sections.value];
  const removed = updated[sIndex];

  // Remove all edges for rows in this section
  removed.rows.forEach((_, rIndex) => {
    props.data.removeButtonEdges(
      props.id,
      `sec-${sIndex}-row-${rIndex}`
    );
  });

  updated.splice(sIndex, 1);
  props.data.updateNodeData(props.id, { sections: updated });
};

/* Update section title */
const updateSectionTitle = (sIndex, value) => {
  const updated = [...sections.value];
  updated[sIndex].title = value;
  props.data.updateNodeData(props.id, { sections: updated });
};

/* Add row to section */
const addRow = (sIndex) => {
  const updated = [...sections.value];

  updated[sIndex].rows.push({
    title: "",
    description: "",
    connected: false,
  });

  props.data.updateNodeData(props.id, { sections: updated });
};

/* Remove row */
const removeRow = (sIndex, rIndex) => {
  const updated = [...sections.value];

  props.data.removeButtonEdges(
    props.id,
    `sec-${sIndex}-row-${rIndex}`
  );

  updated[sIndex].rows.splice(rIndex, 1);
  props.data.updateNodeData(props.id, { sections: updated });
};

/* Update row fields */
const updateRow = (sIndex, rIndex, key, value) => {
  const updated = [...sections.value];
  updated[sIndex].rows[rIndex][key] = value;
  props.data.updateNodeData(props.id, { sections: updated });
};

/* ===========================
   VALIDATION
=========================== */

const errors = computed(() => {
  const errs = [];

  if (!title.value.trim()) errs.push("Header is required");
  if (!body.value.trim()) errs.push("Body is required");

  if (!sections.value.length) {
    errs.push("At least one section is required");
  }

  sections.value.forEach((sec, sIndex) => {
    if (!sec.title.trim()) {
      errs.push(`Section ${sIndex + 1} title is required`);
    }

    if (!sec.rows.length) {
      errs.push(`Section ${sIndex + 1} must have at least one row`);
    }

    sec.rows.forEach((row, rIndex) => {
      if (!row.title.trim()) {
        errs.push(
          `Row ${rIndex + 1} in Section ${sIndex + 1} needs title`
        );
      }

      // if (!row.connected) {
      //   errs.push(
      //     `Row ${rIndex + 1} in Section ${sIndex + 1} is not connected`
      //   );
      // }
    });
  });

  return errs;
});

/* --------------- UI STATE --------------- */
const collapsed = ref(false);
const toggleCollapse = () => (collapsed.value = !collapsed.value);

const copyNode = () => props.data.copyNode({ id: props.id });
const deleteNode = () => props.data.deleteNode(props.id);
</script>

<template>
  <div
    class="flow-node relative rounded-lg border-2 bg-white shadow-lg"
    style="min-width: 320px; max-width: 400px"
  >
    <div class="h-1.5 bg-green-500 rounded-t-md"></div>

    <div class="p-4">
      <div class="flex items-center justify-between mb-3">

        <div class="flex items-center">
          <div class="mr-3 rounded-lg p-2 bg-blue-100 text-blue-600">
            <i class="las la-list"></i>
          </div>
          <div class="text-sm font-medium">List Message</div>
        </div>


        <div class="flex space-x-1">
          <button @click="toggleCollapse" class="border p-1.5 rounded-md">
            <i :class="collapsed ? 'las la-angle-down' : 'las la-angle-up'"></i>
          </button>

          <button @click="copyNode" class="border p-1.5 rounded-md">
            <i class="las la-copy"></i>
          </button>

          <button
            @click="deleteNode"
            class="border p-1.5 rounded-md text-red-600"
          >
            <i class="las la-trash-alt"></i>
          </button>
        </div>
      </div>

      <div v-show="!collapsed">
        <label class="text-xs font-medium">Title</label>
        <input
          v-model="title"
          class="w-full border rounded-md p-2 text-sm mb-2"
          placeholder="Enter list title"
        />

        <label class="text-xs font-medium">Body</label>
        <textarea
          v-model="body"
          rows="3"
          class="w-full border rounded-md p-2 text-sm mb-2"
          placeholder="Enter message body"
        />

        <label class="text-xs font-medium">Button Text</label>
        <input
          v-model="buttonText"
          class="w-full border rounded-md p-2 text-sm mb-2"
        />

        <label class="text-xs font-medium">Footer (optional)</label>
        <input
          v-model="footer"
          class="w-full border rounded-md p-2 text-sm mb-3"
          placeholder="Footer text"
        />

        <hr class="my-3" />

        <div class="flex justify-between items-center mb-2">
          <span class="text-sm font-medium">Sections</span>
          <button
            @click="addSection"
            class="text-xs bg-blue-50 text-blue-600 px-2 py-1 rounded"
          >
            + Add Section
          </button>
        </div>

        <div
          v-for="(sec, sIndex) in sections"
          :key="sIndex"
          class="border rounded-md p-3 mb-3 bg-blue-50"
        >
          <div class="flex justify-between items-center mb-2">
            <input
              :value="sec.title"
              @input="e => updateSectionTitle(sIndex, e.target.value)"
              class="border rounded-md p-1 text-sm w-3/4"
              placeholder="Section title"
            />

            <button
              @click="removeSection(sIndex)"
              class="text-red-500 text-xs"
            >
              Delete
            </button>
          </div>

          <div
            v-for="(row, rIndex) in sec.rows"
            :key="rIndex"
            class="border rounded-md p-2 mb-2 bg-white relative"
          >
            <input
              :value="row.title"
              @input="
                e => updateRow(sIndex, rIndex, 'title', e.target.value)
              "
              class="border rounded-md p-1 text-sm w-full mb-1"
              placeholder="Row title"
            />

            <input
              :value="row.description"
              @input="
                e =>
                  updateRow(
                    sIndex,
                    rIndex,
                    'description',
                    e.target.value
                  )
              "
              class="border rounded-md p-1 text-sm w-full"
              placeholder="Row description (optional)"
            />

            <button
              @click="removeRow(sIndex, rIndex)"
              class="absolute top-1 right-2 text-red-500 text-xs"
            >
              ✕
            </button>

            <!-- CONNECTION HANDLE PER ROW -->
            <Handle
              type="source"
              :id="`sec-${sIndex}-row-${rIndex}`"
              :position="Position.Right"
              class="!h-4 !w-4 bg-blue-500"
            />
          </div>

          <button
            @click="addRow(sIndex)"
            class="w-full py-1 text-xs bg-blue-100 text-blue-700 rounded"
          >
            + Add Row
          </button>
        </div>

        <!-- Validation errors -->
        <div
          v-if="errors.length"
          class="mt-3 p-2 bg-red-50 text-red-700 text-xs rounded"
        >
          <div v-for="(e, i) in errors" :key="i">• {{ e }}</div>
        </div>
      </div>
    </div>

    <Handle
      type="target"
      id="input"
      :position="Position.Left"
      class="!h-4 !w-4 bg-green-500"
    />
  </div>
</template>
