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
    $(this).toggleClass("selected");
    // $(".selected > .fa-check-circle").addClass("show");
  });
});

