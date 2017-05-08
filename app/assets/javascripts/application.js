// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require turbolinks
//= require jquery_ujs
//= require Chart.bundle
//= require chartkick
//= require date_range_picker
//= require_tree .
$(document).on("click", ".element", function(){
   $.ajax({
     type: "GET",
     url: "lead/create.js.erb"
  });
});

$(document).on('turbolinks:load', function(){
    $('.datepicker').datepicker({
    });
});
$(document).on('turbolinks:load', function(){
  $('.colorpicker').colorpicker();
});
$(document).on('turbolinks:load', function(){
   $( "#resizable" ).resizable();
});
