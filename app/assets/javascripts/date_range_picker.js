var date_range_picker;
date_range_picker = function() {
  $('.date-range-picker').each(function(){
    $(this).daterangepicker({
      "timePicker": true,
      "timePickerIncrement": 15,
      "showCustomRangeLabel": false,
      "alwaysShowCalendars": false,
      "applyClass": "btn-primary",
      "cancelClass": "btn-danger",
        locale: {
            format: 'MM/DD/YYYY h:mm A'
        }
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
  })
  $('.date-range-picker-time').each(function(){
    $(this).daterangepicker({
      "timePicker": true,
      "timePickerIncrement": 15,
      "applyClass": "btn-primary",
      "cancelClass": "btn-danger",
        locale: {
            format: 'h:mm A'
        }
    }, function(start, end, label) {
      $('.start_hidden').val(start.format('YYYY-MM-DD HH:mm'));
      $('.end_hidden').val(end.format('YYYY-MM-DD HH:mm'));
    });
    $('.calendar-table').hide();
  })
};
$(document).on('turbolinks:load', date_range_picker);
