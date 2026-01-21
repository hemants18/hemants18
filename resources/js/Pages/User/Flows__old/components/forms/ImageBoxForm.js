export const imageBoxForm = {
  data: {
    image: null,
    image_duration: 1,
  },
  inputs: [
    {
      type: 'input',
      name: 'image_duration',
      label: 'Delay (sec)',
      inputType: 'number',
      class: 'col-span-6',
    },
    {
      type: 'image',
      name: 'image',
      label: 'Image',
      class: 'col-span-6',
    },
  ],
}
