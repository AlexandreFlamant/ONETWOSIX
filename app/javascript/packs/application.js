import "bootstrap";
import $ from "jquery";
import slick from "../../assets/slick/slick.min.js";



$(document).ready(function(){

  $('.carousel').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
  })

  $('.modal').on('shown.bs.modal', function () {
    $('.carousel').slick("setPosition", 0);
  })
});


import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();


// for genre and foodtype selection in carousel
$(document).ready(function(){
  $(".select-choice").click(function(){
    $(this).closest('.check_boxes').find('.select-choice').removeClass('selected');
    $(this).closest('.check_boxes').find(".fa-check-circle").removeClass("show");
    $(this).toggleClass("selected");
    $(this).find(".fa-check-circle").toggleClass("show");
  });
});



// $(":checkbox").click(function(){
//   $length = $(":checkbox").length();
//   if ( $length > 2 ) {
//     $(":checkbox:checked").attr("disabled", true);
//   } else {
//     $(":checkbox").removeAttr("disabled");
//   }
// });



  // $('input[type=checkbox]').change(function(){
  //    if ($('input[type=checkbox]:checked').length > 1) {
  //         $(this)..attr('checked', true);
  //    }
  // })
