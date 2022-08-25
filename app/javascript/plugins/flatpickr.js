import flatpickr from "flatpickr";

const initFlatpickr = () => {
  console.log("flatpicker initialized!");
  flatpickr(".datepicker",
            {altInput: true,
             minDate: "today"});
};

export { initFlatpickr };
