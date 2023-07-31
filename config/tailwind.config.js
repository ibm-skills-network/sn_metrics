const defaultTheme = require("tailwindcss/defaultTheme");

module.exports = {
  content: [
    "./app/views/**/*.erb",
    "./app/components/**/*.erb",
    "./app/inputs/custom_inputs/**/*.rb",
  ],
  safelist: [
    { pattern: /^bg-(.*)-(50|400)$/ },
    { pattern: /^text-(.*)-(400|500|600|700|800)$/ },
    { pattern: /^ring-offset-(.*)-50$/, variants: ["focus"] },
    { pattern: /^ring-(.*)-600$/, variants: ["focus"] },
    { pattern: /^bg-(.*)-100$/, variants: ["hover"] },
    { pattern: /^col-span-(.*)$/, variants: ["sm"] },
    { pattern: /^row-span-(.*)$/, variants: ["sm"] },
    { pattern: /^line-clamp-(.*)$/ },
    { pattern: /^border-(.*)-600$/, variants: ["focus", "focus-within"] },
    { pattern: /^text-(.*)-600$/, variants: ["hover"] },
    { pattern: /^ring-offset-(.*)-50$/ },
    { pattern: /^ring-offset-(.*)-100$/, variants: ["focus"] },
    { pattern: /^ring-(.*)-500$/, variants: ["focus"] },
    { pattern: /^border-(indigo|red)-(500|600)$/ },
    "shadow-red-500",
    "hover:border-red-600",
    "shadow-input-glow"
  ],
  darkMode: "media",
  variants: {
    extend: {
      opacity: ["disabled"],
      cursor: ["disabled"]
    },
  },
  plugins: [
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/forms"),
    require("@tailwindcss/typography"),
    require("@tailwindcss/line-clamp"),
  ],
};
