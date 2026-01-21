// import { reactive, readonly } from 'vue';
// import FlowService from '../services/FlowService';

// /**
//  * Global reactive state (singleton)
//  */
// const state = reactive({
//   flows: [],
//   selectedFlow: null,
//   error: null,
//   loading: false,
//   pagination: {
//     currentPage: 1,
//     totalPages: 1,
//     perPage: 10,
//   },
//   searchQuery: '',
// });

// /**
//  * Actions (same as Pinia)
//  */
// const actions = {
//   // Fetch flows with pagination and search
//   async fetchFlows({ page = 1, searchQuery = '' } = {}) {
//     state.loading = true;
//     state.searchQuery = searchQuery;

//     try {
//       const response = await FlowService.getFlows(page, searchQuery);

//       state.flows = response.data.flows;
//       state.pagination.currentPage = response.data.current_page;
//       state.pagination.totalPages = response.data.last_page;
//       state.error = null;

//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     } finally {
//       state.loading = false;
//     }
//   },

//   // Add a new flow
//   async addFlow(flowData) {
//     try {
//       const response = await FlowService.addFlow(flowData);
//       state.flows.push(response.data);
//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     }
//   },

//   // Update an existing flow
//   async updateFlow(flowData) {
//     try {
//       const response = await FlowService.updateFlow(flowData);
//       const index = state.flows.findIndex(f => f.id === flowData.id);

//       if (index !== -1) {
//         state.flows[index] = response.data;
//       }

//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     }
//   },

//   // Delete a flow
//   async deleteFlow(flowId) {
//     try {
//       await FlowService.deleteFlow(flowId);
//       state.flows = state.flows.filter(flow => flow.id !== flowId);
//     } catch (error) {
//       state.error = error;
//       throw error;
//     }
//   },

//   // Fetch single flow
//   async fetchFlowById(flowId) {
//     state.loading = true;

//     try {
//       const response = await FlowService.getFlowById(flowId);
//       state.selectedFlow = response.data;
//       return response;
//     } catch (error) {
//       state.error = error;
//       throw error;
//     } finally {
//       state.loading = false;
//     }
//   },

//   // Pagination
//   setCurrentPage(page) {
//     state.pagination.currentPage = page;
//     actions.fetchFlows({ page, searchQuery: state.searchQuery });
//   },

//   // Search
//   setSearchQuery(query) {
//     state.searchQuery = query;
//     actions.fetchFlows({ page: 1, searchQuery: query });
//   },
// };

// /**
//  * Export composable
//  */
// export function useFlowStore() {
//   return {
//     // state
//     state: readonly(state),

//     // getters (Pinia-style)
//     flows: () => state.flows,
//     selectedFlow: () => state.selectedFlow,
//     isLoading: () => state.loading,
//     hasError: () => state.error !== null,

//     // actions
//     ...actions,
//   };
// }









//old code
import { defineStore } from 'pinia';
import FlowService from '../services/FlowService';
export const useFlowStore = defineStore('flow', {
  state: () => ({
    flows: [],
    selectedFlow: null,
    error: null,
    loading: false,
    pagination: {
      currentPage: 1,
      totalPages: 1,
      perPage: 10,
    },
    searchQuery: '',
  }),

  getters: {
    allFlows: (state) => state.flows,
    isLoading: (state) => state.loading,
    hasError: (state) => state.error !== null,
  },
  actions: {
    // Fetch flows with pagination and search
    fetchFlows({ page = 1, searchQuery = '' }) {
      this.loading = true;
      this.searchQuery = searchQuery;
      return FlowService.getFlows(page, searchQuery)
        .then((response) => {
         console.log(response.data.flows.data);
          this.flows = response.data.flows;
          this.pagination.currentPage = response.data.current_page;
          this.pagination.totalPages = response.data.last_page;
          this.error = null;
          return Promise.resolve(response);
        })
        .catch((error) => {
          this.error = error;
          return Promise.reject(error);
        })
        .finally(() => {
          this.loading = false;
        });
    },

    // Add a new flow
    addFlow(flowData) {
      return FlowService.addFlow(flowData)
        .then((response) => {
          this.flows.push(response.data);
          return Promise.resolve(response);
        })
        .catch((error) => {
          this.error = error;
          return Promise.reject(error);
        });
    },

    // Update an existing flow
    updateFlow(flowData) {
      return FlowService.updateFlow(flowData)
        .then((response) => {
          const index = this.flows.findIndex((f) => f.id === flowData.id);
          if (index !== -1) {
            this.flows[index] = response.data;
          }
          return Promise.resolve(response);
        })
        .catch((error) => {
          this.error = error;
          return Promise.reject(error);
        });
    },

    // Delete a flow
    deleteFlow(flowId) {
      return FlowService.deleteFlow(flowId)
        .then(() => {
          this.flows = this.flows.filter((flow) => flow.id !== flowId);
          return Promise.resolve();
        })
        .catch((error) => {
          this.error = error;
          return Promise.reject(error);
        });
    },

    // Fetch a single flow by ID
    fetchFlowById(flowId) {
      this.loading = true;
      return FlowService.getFlowById(flowId)
        .then((response) => {
          this.selectedFlow = response.data;
          return Promise.resolve(response);
        })
        .catch((error) => {
          this.error = error;
          return Promise.reject(error);
        })
        .finally(() => {
          this.loading = false;
        });
    },

    // Set the current page for pagination
    setCurrentPage(page) {
      this.pagination.currentPage = page;
      this.fetchFlows({ page, searchQuery: this.searchQuery });
    },

    // Set the search query and fetch flows based on it
    setSearchQuery(query) {
      this.searchQuery = query;
      this.fetchFlows({ page: 1, searchQuery: query });
    },
  },
});