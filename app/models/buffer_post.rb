class BufferPost < ActiveRecord::Base

  def from_event(event)
    # If we really want to post this to BufferPost
    message = "Today: #{event.title} - #{event_path}"

    # Create the string we're posting

    # Instantiate buffer object with key

    # Post the message to buffer

    # If its related to Penzance, post it to PP too
  end

  def self.from_string(message)
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
    content = { body: {
      text: message, profile_ids: ['56f80e1deffee10e24af61d1',
        '56d83b4466da7be537d36a6e', '56f8f7510909552d39e25ce6']
      }
    }
    return buffer.create_update(content)
  end
end
