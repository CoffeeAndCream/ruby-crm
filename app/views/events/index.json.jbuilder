json.array! @events do |event|
  date_format = event.all_day_event? ? '%Y-%m-%d' : '%Y-%m-%dT%H:%M:%S'
  date_format = '%H:%M:%S' unless event.dow.empty?
  json.id event.id
  json.resourceId event.user_id
  json.title event.title
  json.start event.start.strftime(date_format)
  json.end event.ends.strftime(date_format)
  json.color event.color unless event.color.blank?
  json.dow event.dow unless event.dow.empty?
  json.draggable false unless event.dow.empty?
  json.allDay event.all_day_event? ? true : false
  json.update_url event_path(event, method: :patch)
  json.edit_url edit_event_path(event)
end
