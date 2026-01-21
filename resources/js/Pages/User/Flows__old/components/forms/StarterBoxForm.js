export const starterBoxForm = {
  data: {
    keyword: '',
    matching_types: 'exacts',
  },
  inputs: [
    {
      type: 'input',
      name: 'keyword',
      label: 'Keyword',
      class: 'col-span-6',
    },
    {
      type: 'select',
      name: 'matching_types',
      label: 'Matching Type',
      options: [
        { label: 'Exact', value: 'exacts' },
        { label: 'Contains', value: 'contains' },
      ],
      class: 'col-span-6',
    },
  ],
}
