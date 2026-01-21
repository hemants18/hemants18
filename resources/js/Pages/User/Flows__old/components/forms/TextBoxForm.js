export const textBoxForm = {
  data: {
    text: '',
    text_duration: 1,
  },
  inputs: [
    {
      type: 'input',
      name: 'text_duration',
      label: 'Delay (sec)',
      inputType: 'number',
      class: 'col-span-6',
    },
    {
      type: 'input',
      name: 'text',
      label: 'Message',
      class: 'col-span-6',
    },
  ],
}
