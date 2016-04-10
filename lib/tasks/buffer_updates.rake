desc 'send todays updates to buffer'
task send_buffer_updates: :environment do
  events = Event.where('date = ?', Time.zone.now.beginning_of_day)
  events.map {|e| BufferPost.from_event(e)}
end
