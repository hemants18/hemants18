/** @type {import('tailwindcss').Config} */ 
module.exports = { 
  content: [ 
      "./resources/**/*.blade.php", 
      "./resources/**/*.js", "./resources/**/*.vue", 
      "./src/**/*.{html,js}", 
  ], 
  
  // Old
  theme: { 
    extend: { 
        colors: { 
            primary: '#2a823f', 
            secondary: '#116db0', 
        }, 
        fontFamily: { 
            'Outfit': ['Outfit', 'Helvetica', 'Arial', 'sans-serif'], 
        }, 
        lineHeight: { 
            '15': '3rem', 
            '20': '65px', // Add more custom line height classes as needed 
        }, 
      }, 
    },

  //New
  // theme: {
  //   extend: {
  //     colors: {
  //       whatsapp: {
  //         green: '#25D366',
  //         dark: '#075E54',
  //         light: '#DCF8C6',
  //         bg: '#F0F2F5',
  //       },
  //     },
  //     fontSize: {
  //       xs: '12px',
  //       sm: '13px',
  //       base: '14px',   // WhatsApp default
  //       lg: '16px',
  //     },
  //   },
  // },
  plugins: [], 
  darkMode: "class" 
}