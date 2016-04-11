class BufferPost

  # Rails.application.routes.default_url_options[:host] = 'https://westcornwallevents.co.uk'


  def self.from_event(event)
    BufferJob.perform_now(post_to_twitter(event))
    BufferJob.perform_now(post_to_facebook(event))
    BufferJob.perform_now(post_to_google(event))
    return
  end

  def self.from_string(message)
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
    buffer.create_update(create_post_object(message))
    return
  end

  private

  def self.create_post_object(message)
    return { body: {
      text: message, profile_ids: [
        ENV['BUFFER_TWITTER_KEY'],
        ENV['BUFFER_FACEBOOK_KEY'],
        ENV['BUFFER_GOOGLE_KEY']]
      }
    }
  end

  def self.post_to_twitter(event)
    return { body: {
        text: twitter_message(event),
        profile_ids: [ENV['BUFFER_TWITTER_KEY']]
      }
    }
  end

  def self.post_to_facebook(event)
    return { body: {
        text: facebook_message(event),
        profile_ids: [ENV['BUFFER_FACEBOOK_KEY']]
      }
    }
  end

  def self.post_to_google(event)
    return { body: {
        text: google_message(event),
        profile_ids: [ENV['BUFFER_GOOGLE_KEY']]
      }
    }
  end

  def self.twitter_message(event)
    include Rails.application.routes.url_helpers
    # TODO Ensure the message is not too long. How long
    # can it be, taking into account the actual url length
    return "Today: #{event.title} - #{ActionView::Helpers::event_url(event)}"
  end

  def self.google_message(event)
    include Rails.application.routes.url_helpers
    # TODO Ensure the message is not too long. How long
    # can it be, taking into account the actual url length
    return "Today: #{event.title} #{ActionView::Helpers::event_url(event)}"
  end

  def self.facebook_message(event)
    include Rails.application.routes.url_helpers
    # TODO Ensure the message is not too long. How long
    # can it be, taking into account the actual url length

    # TODO Should I only post the event to facebook if there isa
    # no image? Afterall... they have not interactions
    return "Today: #{event.title} #{ActionView::Helpers::event_url(event)}"
  end
end
