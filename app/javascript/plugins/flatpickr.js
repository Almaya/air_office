import flatpickr from "flatpickr";

const initFlatpickr = () => {
  console.log("flatpicker initialized!");
  flatpickr(".datepicker", {});
};

export { initFlatpickr };
