var initialize_calendar;

initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      dayRender: function (date, cell, view) {
        if(view.type === 'timelineDay'){
          var check = $.fullCalendar.formatDate(date,'HH:mm');
          console.log(String(view.type));
          if(check < '08:00' || check > '16:30'){
            cell.css("background-color", "#e9e9e9");
          }
        }
      },
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
			editable: true, // enable draggable events
      resourceEditable: true,
      draggable: true,
      selectable: true,
      selectHelper: true,
      height: 625,
      slotWidth: 50,
			scrollTime: '8:00', // undo default 7am scrollTime
      titleFormat: 'dddd MM/DD',
			header: {
				left: 'today prev,next',
				center: 'title',
				right: 'timelineDay,basicWeek,month'
      },
      buttonText : {
        prev : '<',
        next : '>'
      },
			defaultView: 'timelineDay',
      defaultEventMinutes: 90,
      eventLimit: true,
      resources: gon.resources,
      events: '/events.json',
      theme: 'jquery-ui',

      select: function(start, end, ev, view, resource) {
        $.getScript('/events/new', function() {
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
          if(resource) {
            $('.salesperson').val(resource.id);
          }
          if(gon.lead){
            if(confirm('Do you want to set this appointment for ' + gon.lead.first_name + ' ' + gon.lead.last_name + '?')) {
              $('.lead_id').val(gon.lead.id);
              $('.event_title').val(gon.lead.last_name + ' - ' + gon.lead.city +', '+gon.lead.zip);
              gon.lead = '';
            }
          };
        });
        calendar.fullCalendar('unselect');
      },
      eventDrop: function(event, delta, revertFunc, resourceId) {
        event_data = {
          event: {
            id: event.id,
            user_id: event.resourceId,
            start: event.start.format(),
            ends: event.end.format()
          }
        };
        $.ajax({
            url: event.update_url,
            data: event_data,
            type: 'PATCH'
        });
      },
      eventClick: function(event, jsEvent, view) {
        console.log(event.start, event.end);

        $.getScript(event.edit_url, function() {
          $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"));
          date_range_picker();
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
        });
      }
    });
  });
};
$(document).on('turbolinks:load', initialize_calendar);
