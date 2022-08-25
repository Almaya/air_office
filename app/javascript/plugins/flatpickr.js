import flatpickr from "flatpickr";

const initFlatpickr = () => {
  console.log("flatpicker initialized!");
  flatpickr(".datepicker",
            {mode: "range",
             altInput: true,
             minDate: "today"});
};

export { initFlatpickr };
