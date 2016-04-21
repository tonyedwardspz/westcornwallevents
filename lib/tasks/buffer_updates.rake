desc 'send todays updates to buffer'
task send_buffer_updates: :environment do
  events = Event.where('date = ?', Time.zone.now.beginning_of_day).limit(3).includes(:venue)
  events.map {|e| BufferPost.from_event(e)}
end
