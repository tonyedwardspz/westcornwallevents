class Admin::BufferController < Admin::AdminAreaController

  def post_string_to_buffer
    buffer = BufferPost.from_string('Post this string to buffer')
    puts buffer
    redirect_to admin_settings_general_path
  end

  def post_event_to_buffer
    event = Event.order('created_at').last
    buffer = BufferPost.from_event(event)
    puts buffer
    redirect_to admin_settings_general_path
  end

end
