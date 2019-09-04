import $ from 'jquery';
import 'select2';


const initSelect2 = () => {

  function matchStart(params, data) {
    // If there are no search terms, return all of the data
    if ($.trim(params.term) === '') {
      return data;
    }

    // Skip if there is no 'children' property
    if (typeof data.children === 'undefined') {
      return null;
    }

    // `data.children` contains the actual options that we are matching against
    var filteredChildren = [];
    $.each(data.children, function (idx, child) {
      if (child.text.toUpperCase().indexOf(params.term.toUpperCase()) == 0) {
        filteredChildren.push(child);
      }
    });

    // If we matched any of the timezone group's children, then set the matched children on the group
    // and return the group object
    if (filteredChildren.length) {
      var modifiedData = $.extend({}, data, true);
      modifiedData.children = filteredChildren;

      // You can return modified objects from here
      // This includes matching the `children` how you want in nested data sets
      return modifiedData;
    }

    // Return `null` if the term should not be displayed
    return null;
  }

  $('.select2').select2({
    placeholder: "Select from the list",
    matcher: matchStart
  });
};

export { initSelect2 };
