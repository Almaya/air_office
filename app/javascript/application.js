// Entry point for the build script in your package.json
import "@hotwired/turbo-rails"
import "./controllers"
import "bootstrap"
import { initFlatpickr } from "./plugins/flatpickr"

console.log("application.js is running...");


document.addEventListener('turbo:load', () => {
  initFlatpickr();
})
