import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('.select2').select2({
    placeholder: "Select from the list"
  });
};

export { initSelect2 };
