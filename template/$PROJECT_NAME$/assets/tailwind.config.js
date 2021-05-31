const base = require("./tailwind.helpers");

module.exports = {
  mode: 'jit',
  presets: [require("./brand.preset")],
  purge: {
    content: base.content(),
    options: {
      // safelist: Prevents classes to be removed.
      // Dev tip: If your styles don't show correctly on prod, it could be because those classes are running behind of a condition.
      // `base.noPurge` accepts a list, that list must include the classes which are behind a condition.
      // The function just concat the default classes which are for flash messages.
      safelist: base.noPurge(),
    },
  },
  variants: {},
  plugins: [require('@tailwindcss/forms')],
};
