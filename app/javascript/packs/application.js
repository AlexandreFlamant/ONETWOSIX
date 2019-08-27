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


