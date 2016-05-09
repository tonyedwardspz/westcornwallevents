desc 'send todays updates to buffer'
task send_buffer_updates: :environment do
  # Get upto 3 events for today
  events = Event.where('date = ?', Time.zone.now.beginning_of_day).limit(3).includes(:venue)

  puts events
  puts ''
  puts events
  puts '----------'
  puts ''

  # Get 1 event from next week
  events << Event.where("created_at >= ? AND created_at <= ?", 1.day.from_now, 10.days.from_now ).limit(3).includes(:venue)

  puts events

  events.map {|e| BufferPost.from_event(e)}
end
