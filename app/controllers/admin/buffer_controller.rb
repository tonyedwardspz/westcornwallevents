class Admin::BufferController < Admin::AdminAreaController

  def auth_with_buffer
    buffer = BufferPost.from_string('Post this to buffer aswell')
    puts buffer
    redirect_to admin_settings_general_path
  end

end
