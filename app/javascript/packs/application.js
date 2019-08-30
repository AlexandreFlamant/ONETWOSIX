import "bootstrap";
import $ from "jquery";
import slick from "../../assets/slick/slick.min.js";
import { initAutocomplete } from '../plugins/init_autocomplete';

initAutocomplete();


// carousel jQuery: for .carousel & .fresh-carousel
$(document).ready(function(){

  $('.carousel').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3
  })

  $('.fresh-carousel').slick({
    centerMode: true,
    centerPadding: '60px',
    slidesToShow: 3,
    autoplay: true,
    autoplaySpeed: 2000,
    pauseonFocus: true
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





//media query for carousel for mobile photo: change slidesToShow from 3 to 1:
// $(document).ready(function(){
//   if (window.matchMedia("(max-width: 500px)").matches) {
//    $('.fresh-carousel').slick({
//       centerMode: true,
//       centerPadding: '60px',
//       slidesToShow: 1,
//       autoplay: true,
//       autoplaySpeed: 2000,
//       pauseonFocus: true
//     });
//    $('.modal').on('shown.bs.modal', function () {
//     $('.fresh-carousel').slick("setPosition", 0);
//     });
//    $('.carousel').slick({
//       centerMode: true,
//       centerPadding: '60px',
//       slidesToShow: 1
//     });
//    $('.modal').on('shown.bs.modal', function () {
//     $('.carousel').slick("setPosition", 0);
//     });
//   }
//   else {
//     $('.carousel').slick({
//     centerMode: true,
//     centerPadding: '60px',
//     slidesToShow: 3
//   })

//   $('.fresh-carousel').slick({
//     centerMode: true,
//     centerPadding: '60px',
//     slidesToShow: 3,
//     autoplay: true,
//     autoplaySpeed: 2000,
//     pauseonFocus: true
//   })

//   $('.modal').on('shown.bs.modal', function () {
//     $('.carousel').slick("setPosition", 0);
//   })

//   $('.modal').on('shown.bs.modal', function () {
//     $('.fresh-carousel').slick("setPosition", 0);
//   })
//   }
// }
