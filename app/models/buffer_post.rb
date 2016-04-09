
include Rails.application.routes.url_helpers
Rails.application.routes.default_url_options[:host] = 'https://westcornwallevents.co.uk'

class BufferPost < ActiveRecord::Base

  def self.from_event(event)
    # Instantiate buffer object with key
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])

    # Create the string we're posting
    # TODO Create different messages for each social network
    twitter_message = twitter_message(event)

    # Create the buffer post object
    # TODO Post each message to the respective social network
    content = create_post_object(twitter_message)

    # Post the message to buffer
    # TODO Add this to an 'async' queue, return true or false instead
    return buffer.create_update(content)

    # TODO If related to Penzance, post it to Purely Penzance too.
  end

  def self.from_string(message)
    buffer = Buffer::Client.new(ENV['BUFFER_ACCESS_TOKEN'])
    content = create_post_object(twitter_message)
    return buffer.create_update(content)
  end

  private

  def self.create_post_object(message)
    return { body: {
      text: message, profile_ids: [
        '56f80e1deffee10e24af61d1',
        '56d83b4466da7be537d36a6e',
        '56f8f7510909552d39e25ce6']
      }
    }
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
