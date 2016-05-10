desc 'send todays updates to buffer'
task send_buffer_updates: :environment do


  todays_events = Event.where('date = ?', Time.zone.now.beginning_of_day).limit(3).includes(:venue)
  todays_events.map {|e| BufferPost.from_event(e)}

  # weekly_event = Event.created_between(Time.zone.now.beginning_of_day, 7.days.from_now)
  # BufferPost.from_event(weekly_event)
end
