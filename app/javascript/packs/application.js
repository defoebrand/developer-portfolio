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

    // $(".home").hover(function() {
    //   $(this).css("background-color", "yellow");
    // }, function() {
    //   $(this).css("background-color", "pink");
    // });

    $('.web-form').mouseover(function(event) {
      $('.title-change').toggleClass('title-changed');
      $('.title-change').text('coder');
      $('.interest-change').toggleClass('interest-changed');
      $('.interest-change').text('debug code');
    });

    $('.employee-form').mouseover(function(event) {
      $('.title-change').toggleClass('title-changed');
      $('.title-change').text('hard worker');
      $('.interest-change').toggleClass('interest-changed');
      $('.interest-change').text('solve problems');
    });

    $('.tutor-form').mouseover(function(event) {
      $('.title-change').toggleClass('title-changed');
      $('.title-change').text('teacher');
      $('.interest-change').toggleClass('interest-changed');
      $('.interest-change').text('help others');
    });



    // $('.m-3').mouseover(function(event) {
    //   $('.title-changed').toggleClass('title-change');
    //   $('.title-changed').text('teacher');
    // });

    // $('.account-menu').click(function(event) {
    //   $('.ac-hidden').toggleClass('ac-visible');
    // });

    // $('.m-3').hover(function(event) {
    //   $('.interest-change').html('debug code');
    // });

  });

});