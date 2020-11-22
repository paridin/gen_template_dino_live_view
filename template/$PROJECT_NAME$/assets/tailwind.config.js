const base = require("./tailwind.helpers");

module.exports = {
  future: {
    removeDeprecatedGapUtilities: true,
  },
  presets: [require("./brand.preset")],
  purge: {
    content: base.content(),
    defaultExtractor: (content) => content.match(/[\w-/.:]+(?<!:)/g) || [],
    options: {
      // whitelist: Prevents classes to be removed.
      // Dev tip: If your styles don't show correctly on prod, it could be because those classes are running behind of a condition.
      // `base.noPurge` accepts a list, that list must include the classes which are behind a condition.
      // The function just concat the default classes which are for flash messages.
      whitelist: base.noPurge(),
    },
  },

  variants: {
    ...base.variants,
  },
  plugins: [],
};
