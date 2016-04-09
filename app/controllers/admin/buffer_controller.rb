class Admin::BufferController < Admin::AdminAreaController

  def auth_with_buffer
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
    # puts response
    content = { body: {text: 'This is an update', profile_ids: ['56f80e1deffee10e24af61d1']}}

    response = buffer.create_update(content)
    puts response
    redirect_to admin_settings_general_path
  end

end
