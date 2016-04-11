class Admin::BufferController < Admin::AdminAreaController

  def post_string_to_buffer
    BufferPost.from_string('Post this string to buffer')
    redirect_to admin_settings_general_path
  end

  def post_event_to_buffer
    event = Event.order('created_at').last
    BufferPost.from_event(event)
    redirect_to admin_settings_general_path
  end

end
