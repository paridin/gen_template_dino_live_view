const defaultConfig = require("tailwindcss/defaultConfig");

module.exports = {
  theme: {
    fontFamily: {
      sans: ["Inter var", ...defaultConfig.theme.fontFamily.sans],
    },
    extend: {
      screens: {
        xs: "320px",
      },
    },
  },
};