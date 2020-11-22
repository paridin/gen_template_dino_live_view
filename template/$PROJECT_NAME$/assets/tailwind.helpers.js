export const content = (extras = []) =>
  [
    "../lib/*_web/templates/**/*.html.eex",
    "../lib/*_web/templates/**/*.html.leex",
    "../lib/*_web/views/**/*.ex",
    "../lib/*_web/live/**/*.html.leex",
    "../lib/*_web/live/**/*.ex",
    "./js/**/*.js",
  ].concat(extras);

export const noPurge = (extras = []) =>
  [
    "bg-blue-50",
    "bg-blue-100",
    "text-blue-400",
    "text-blue-500",
    "text-blue-800",
    "bg-yellow-50",
    "bg-yellow-100",
    "text-yellow-400",
    "text-yellow-500",
    "text-yellow-800",
    "bg-red-50",
    "bg-red-100",
    "text-red-400",
    "text-red-500",
    "text-red-800",
    "bg-green-50",
    "bg-green-100",
    "text-green-400",
    "text-green-500",
    "text-green-800",
  ].concat(extras);

export const variants = {
  borderWidth: ["responsive", "group-hover", "hover", "focus"],
  borderRadius: [
    "responsive",
    "group-hover",
    "first",
    "last",
    "hover",
    "focus",
  ],
  borderColor: ["responsive", "group-hover", "hover", "focus"],
  display: ["responsive", "first", "last", "hover", "focus"],
};
