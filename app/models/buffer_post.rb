
include Rails.application.routes.url_helpers
Rails.application.routes.default_url_options[:host] = 'https://westcornwallevents.co.uk'

class BufferPost < ActiveRecord::Base

  def self.from_event(event)
    twitter_content = post_to_twitter(event)
    BufferJob.perform_now(twitter_content)

    facebook_content = post_to_facebook(event)
    BufferJob.perform_now(facebook_content)

    google_content = post_to_google(event)
    BufferJob.perform_now(google_content)
    return
  end

  def self.from_string(message)
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
    content = create_post_object(twitter_message)
    return buffer.create_update(content)
  end

  private

  def self.post_to_twitter(event)
    message = twitter_message(event)
    content = { body: {
        text: message,
        profile_ids: ['56f80e1deffee10e24af61d1']
      }
    }
    return content
  end

  def self.post_to_facebook(event)
    message = facebook_message(event)
    content = { body: {
        text: message,
        profile_ids: ['56f8f7510909552d39e25ce6']
      }
    }
    return content
  end

  def self.post_to_google(event)
    message = google_message(event)
    content = { body: {
        text: message,
        profile_ids: ['56d83b4466da7be537d36a6e']
      }
    }
    return content
  end

  def self.twitter_message(event)
    # TODO Ensure the message is not too long. How long
    # can it be, taking into account the actual url length
    return "Today: #{event.title} - #{event_url(event)}"
  end

  def self.google_message(event)
    # TODO Ensure the message is not too long. How long
    # can it be, taking into account the actual url length
    return "Today: #{event.title}#{event_url(event)}"
  end

  def self.facebook_message(event)
    # TODO Ensure the message is not too long. How long
    # can it be, taking into account the actual url length

    # TODO Should I only post the event to facebook if there isa
    # no image? Afterall... they have not interactions
    return "Today: #{event.title} - #{event_url(event)}"
  end
end
