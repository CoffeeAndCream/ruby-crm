var initialize_calendar;

initialize_calendar = function() {
  $('.calendar').each(function(){
    var calendar = $(this);
    calendar.fullCalendar({
      schedulerLicenseKey: 'CC-Attribution-NonCommercial-NoDerivatives',
			editable: true, // enable draggable events
      resourceEditable: true,
      selectable: true,
      selectHelper: true,
			aspectRatio: 1.8,
			scrollTime: '7:00', // undo default 7am scrollTime
      titleFormat: 'dddd MM/DD',
			header: {
				left: 'today prev,next',
				center: 'title',
				right: 'timelineDay,timelineWeek,month,listWeek'
			},
			defaultView: 'timelineDay',
      defaultEventMinutes: 90,
      eventLimit: true,
      resources: gon.resources,
      events: '/events.json',
      theme: 'jquery-ui',
      aspectRatio: 1.8,

      select: function(start, end, ev, view, resource) {
        $.getScript('/events/new', function() {
          $('#event_date_range').val(moment(start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(end).format('YYYY-MM-DD HH:mm'));
          $('.salesperson').val(resource.id);
          $('.lead_id').val(gon.lead.id);
          $('.event_title').val(gon.lead.first_name + ' ' + gon.lead.last_name);
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
        $.getScript(event.edit_url, function() {
          $('#event_date_range').val(moment(event.start).format("MM/DD/YYYY HH:mm") + ' - ' + moment(event.end).format("MM/DD/YYYY HH:mm"))
          date_range_picker();
          $('.start_hidden').val(moment(event.start).format('YYYY-MM-DD HH:mm'));
          $('.end_hidden').val(moment(event.end).format('YYYY-MM-DD HH:mm'));
        });
      }
    });
  })
};
$(document).on('turbolinks:load', initialize_calendar);
