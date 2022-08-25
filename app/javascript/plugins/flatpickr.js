import flatpickr from "flatpickr";

const initFlatpickr = () => {
  console.log("flatpicker initialized!");
  flatpickr(".datepicker",
            {mode: "range",
             altInput: true,
             minDate: "today",
             maxDate: new Date().fp_incr(365)});
};

export { initFlatpickr };
