const defaultConfig = require('tailwindcss/defaultConfig');

module.exports = {
  purge: {
    content: [
      '../lib/*_web/templates/**/*.html.eex',
      '../lib/*_web/views/**/*.ex',
      '../lib/*_web/live/**/*.html.leex',
      '../lib/*_web/live/**/*.ex',
      './js/**/*.js',
    ],
    defaultExtractor: content => content.match(/[\w-/.:]+(?<!:)/g) || []
  },
  theme: {
    fontFamily: {
      'sans': ['Inter var', ...defaultConfig.theme.fontFamily.sans]
    },
    extend: {
      screens: {
        'xs': '320px'
      },
      height: {
        'h-1/2': '50%',
        'h-1/3': '33.333333%',
        'h-2/3': '66.666667%',
        'h-1/4': '25%',
        'h-2/4': '50%',
        'h-3/4': '75%',
        'h-1/5': '20%',
        'h-2/5': '40%',
        'h-3/5': '60%',
        'h-4/5': '80%',
        'h-1/6': '16.666667%',
        'h-2/6': '33.333333%',
        'h-3/6': '50%',
        'h-4/6': '66.666667%',
        'h-5/6': '83.333333%',
        'h-1/12': '8.333333%',
        'h-2/12': '16.666667%',
        'h-3/12': '25%',
        'h-4/12': '33.333333%',
        'h-5/12': '41.666667%',
        'h-6/12': '50%',
        'h-7/12': '58.333333%',
        'h-8/12': '66.666667%',
        'h-9/12': '75%',
        'h-10/12': '83.333333%',
        'h-11/12': '92.666667%'
      }
    }
  },
  variants: {
    borderWidth: ['responsive', 'group-hover', 'hover', 'focus'],
    borderRadius: ['responsive', 'group-hover', 'first', 'last', 'hover', 'focus'],
    borderColor: ['responsive', 'group-hover', 'hover', 'focus'],
    display: ['responsive', 'first', 'last', 'hover', 'focus'],
  },
  plugins: [
    // Install Tailwind UI only if you have a license then run, npm install @tailwindcss/ui --save-dev
    // and uncomment the following require
    // require('@tailwindcss/ui'), 
  ]
}
