import "bootstrap";
import $ from "jquery";
import slick from "../../assets/slick/slick.min.js";
// import { initAutocomplete } from '../plugins/init_autocomplete';
import '../payment';
import 'select2/dist/css/select2.css';
import { initSelect2 } from '../plugins/init_select2';
import { whitenArrow } from '../plugins/slick-arrow.js';


// initAutocomplete();
initSelect2();
whitenArrow();


// carousel jQuery: for .carousel & .fresh-carousel
$(document).ready(function(){

  $('.carousel').slick({
    prevArrow:`<img class='a-left control-c prev slick-prev' src='/assets/arrow-left'>`,
    nextArrow:`<img class='a-right control-c next slick-next' src='/assets/arrow-right'>`,
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 992,
        settings: {
          centerMode: false,
          centerPadding: '30px',
          slidesToShow: 2
        }
      },
      {
        breakpoint: 768,
        settings: {
          centerMode: true,
          centerPadding: '20px',
          slidesToShow: 1
        }
      }
    ]
  })

  $('.fresh-carousel').slick({
    prevArrow:`<img class='a-left control-c prev slick-prev' src='/assets/arrow-left'>`,
    nextArrow:`<img class='a-right control-c next slick-next' src='/assets/arrow-right'>`,
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    autoplay: true,
    autoplaySpeed: 2000,
    pauseonFocus: true,
    responsive: [
      {
        breakpoint: 992,
        settings: {
          centerMode: false,
          centerPadding: '30px',
          slidesToShow: 2
        }
      },
      {
        breakpoint: 768,
        settings: {
          centerMode: true,
          centerPadding: '20px',
          slidesToShow: 1
        }
      }
    ]
    })

  $('.modal').on('shown.bs.modal', function () {
    $('.carousel').slick("setPosition", 0);
  })

  $('.modal').on('shown.bs.modal', function () {
    $('.fresh-carousel').slick("setPosition", 0);
  })
});

// for genre and foodtype selection in carousel
$(document).ready(function(){
  $(".select-choice").click(function(){
    $(this).closest('.check_boxes').find('.select-choice').removeClass('selected');
    $(this).closest('.check_boxes').find(".fa-check-circle").removeClass("show");
    $(this).toggleClass("selected");
    $(this).find(".fa-check-circle").toggleClass("show");
    var genreInput = document.getElementById("hidden_genre");
    var foodtypeInput = document.getElementById("hidden_foodtype");
    var genreAndFoodTypeChoice = document.querySelectorAll(".selected");
    var genre = genreAndFoodTypeChoice[0].lastElementChild.innerText;
    genreInput.value = genre;
    if(genreAndFoodTypeChoice[1]) {
      var foodtype = genreAndFoodTypeChoice[1].lastElementChild.innerText;
      foodtypeInput.value = foodtype;
    }
  });
});

var flash = document.querySelector('.alert');
if (flash) {
  var flashMessage = flash.firstElementChild.innerText;
  console.log(flashMessage);
  if (flashMessage != 'Your payment was successful!') {
    $(function(){
       var flashDurationInSeconds = 3;
       var flashContainerId = 'flash-messages';

       function removeFlashMessages() {
         $('#' + flashContainerId).remove();
       }

       setTimeout(removeFlashMessages, flashDurationInSeconds * 1000);
    })
  }
}

