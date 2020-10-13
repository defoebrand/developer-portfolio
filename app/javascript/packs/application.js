// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

//= require jquery3
//= require popper
//= require bootstrap-sprockets

document.addEventListener("turbolinks:load", function() {

  $(document).ready(function() {


    $('.web-form').mouseover(function(event) {
      $('.title-change').text('coder');
      $('.interest-change').text('debug code');
    });

    $('.employee-form').mouseover(function(event) {
      $('.title-change').text('self-starter');
      $('.interest-change').text('solve problems');
    });

    $('.tutor-form').mouseover(function(event) {
      $('.title-change').text('teacher');
      $('.interest-change').text('help others');
    });

    // $('.up').click(function(event) {
    //   let top_value = $(".content").css("top");
    //   top_value = top_value.slice(0, -2);
    //   let adjusted_value = (Number(top_value) + 300) + "px"
    //   $('.content').animate({
    //     top: adjusted_value
    //   });
    //   // $('.content').css("top", adjusted_value)
    // });
    //
    //
    // $('.down').click(function(event) {
    //   let top_value = $(".content").css("top");
    //   top_value = top_value.slice(0, -2);
    //   let adjusted_value = (Number(top_value) - 300) + "px"
    //   $('.content').animate({
    //     top: adjusted_value
    //   });
    //   // $('.content').css("top", adjusted_value)
    // });

    // $('.up').scroll(function() {
    //   let top_value = $(".content").css("top");
    //   top_value = top_value.slice(0, -2);
    //   let adjusted_value = (Number(top_value) - 275) + "px"
    //   $('.content').animate({
    //     top: adjusted_value
    //   });
    //   // $('.content').css("top", adjusted_value)
    // });

    // $("div").scroll(function() {
    //   $("span").text(x += 1);
    // });

    // $('.websites').hover(function(event) {
    //   $('.fixed-top').animate({
    //     top: "-50px"
    //   });
    // });
    // $('.websites').mouseleave(function(event) {
    //   $('.fixed-top').animate({
    //     top: "0"
    //   });
    // });


  });

});