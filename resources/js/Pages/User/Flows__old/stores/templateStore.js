// import { reactive, readonly } from 'vue';
// import axios from 'axios';
// import globalValue from "../mixins/helper.js";

// const getMixinValue = globalValue();

// /**
//  * Global reactive state (singleton)
//  */
// const state = reactive({
//   templates: [],
//   template: null,
//   loading: false,
//   error: null,
//   currentPage: 1,
//   lastPage: 1,
//   searchQuery: '',
// });

// /**
//  * Actions (Pinia-equivalent)
//  */
// const actions = {
//   async fetchTemplates(page = 1, searchQuery = '') {
//     state.loading = true;
//     state.currentPage = page;
//     state.searchQuery = searchQuery;

//     try {
//       const url = getMixinValue.getUrl("whatsapp-templates?flow_builder=1");

//       const response = await axios.get(url, {
//         params: {
//           page: state.currentPage,
//           search: state.searchQuery,
//         },
//       });

//       state.templates = response.data.templates;
//       state.lastPage = response.data.last_page;
//       state.error = null;

//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     } finally {
//       state.loading = false;
//     }
//   },

//   async loadMoreTemplates() {
//     if (state.currentPage >= state.lastPage) return;

//     state.currentPage++;

//     try {
//       const url = getMixinValue.getUrl("whatsapp-templates");

//       const response = await axios.get(url, {
//         params: {
//           page: state.currentPage,
//           search: state.searchQuery,
//         },
//       });

//       state.templates = [
//         ...state.templates,
//         ...response.data.data,
//       ];

//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     }
//   },

//   async searchTemplates(query) {
//     state.currentPage = 1;
//     state.templates = [];
//     state.searchQuery = query;

//     return actions.fetchTemplates(1, query);
//   },

//   async fetchTemplate(id) {
//     state.loading = true;

//     try {
//       const response = await axios.get(`/api/templates/${id}`);
//       state.template = response.data;
//       state.error = null;
//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     } finally {
//       state.loading = false;
//     }
//   },
// };

// /**
//  * Export composable
//  */
// export function useTemplateStore() {
//   return {
//     // state (readonly)
//     state: readonly(state),

//     // getters (Pinia-like)
//     templates: () => state.templates,
//     template: () => state.template,
//     isLoading: () => state.loading,
//     hasError: () => state.error !== null,
//     currentPage: () => state.currentPage,
//     lastPage: () => state.lastPage,

//     // actions
//     ...actions,
//   };
// }









//old code
import { defineStore } from 'pinia';
import axios from 'axios';
import globalValue from "../mixins/helper.js";

const getMixinValue = globalValue();

export const useTemplateStore = defineStore('templateStore', {
  state: () => ({
    templates: [],
    loading: false,
    error: null,
    currentPage: 1,
    lastPage: 1,
    searchQuery: '',
  }),
  actions: {
    async fetchTemplates(page = 1, searchQuery = '') {
      this.loading = true;
      this.currentPage = page;
      this.searchQuery = searchQuery;

      try {
        const url = getMixinValue.getUrl("whatsapp-templates?flow_builder=1");
        const response = await axios.get(url, {
          params: {
            page: this.currentPage,
            search: this.searchQuery,
          },
        });
        this.templates = response.data.templates;
        this.lastPage = response.data.last_page;
      } catch (error) {
        this.error = error;
      } finally {
        this.loading = false;
      }
    },
    
    async loadMoreTemplates() {
      if (this.currentPage < this.lastPage) {
        this.currentPage++;
        try {
          const url = getMixinValue.getUrl("whatsapp-templates");
          const response = await axios.get(url, {
            params: {
              page: this.currentPage,
              search: this.searchQuery,
            },
          });

          this.templates = [...this.templates, ...response.data.data];
        } catch (error) {
          this.error = error;
        }
      }
    },
    async searchTemplates(query) {
      this.currentPage = 1;
      this.templates = [];
      await this.fetchTemplates(1, query);
    },
    async fetchTemplate(id) {
      this.loading = true;
      try {
        const response = await axios.get(`/api/templates/${id}`);
        this.template = response.data;
      } catch (error) {
        this.error = error;
      } finally {
        this.loading = false;
      }
    },
  },
});