// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require js/jquery.autotab.js
//= require js/foundation.min
//= require js/foundation/foundation.offcanvas
//= require_tree .
$( document ).ready(function() {
  $(document).foundation()
});
$(document).ready(function() {
  $('#pick_number1').autotab({ target: '#pick_number2', format: 'numeric' });
    $('#pick_number2').autotab({ target: '#pick_number3', format: 'numeric'});
     $('#pick_number3').autotab({ target: '#pick_number4', format: 'numeric'});
      $('#pick_number4').autotab({ target: '#pick_number5', format: 'numeric'});
       $('#pick_number5').autotab({ target: '#pick_number6', format: 'numeric'});
});