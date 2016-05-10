class BufferPost < ActiveRecord::Base
  def self.from_event(event)
    BufferJob.perform_now(post_to_twitter(event))
    BufferJob.perform_now(post_to_facebook(event))
    BufferJob.perform_now(post_to_google(event))

    # If event is in penzance, post it to the Purely Penzance feed
    # if event.locaition.downcase.include? 'penzance'
    #   BufferJob.perform_now(post_to_facebook(event, ENV['BUFFER_PURELY_FACEBOOK_KEY']))
    # end

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

  def self.post_to_facebook(event, key = ENV['BUFFER_FACEBOOK_KEY'])
    return { body: {
        text: facebook_message(event),
        profile_ids: [key]
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
    message = "Today: #{event.title}"

    if message.length <= 116
      if event.venue.present?
        if event.venue.twitter_handle.present?
          if event.venue.twitter_handle.length <= (110 - message.length)
            return "#{message} via @#{event.venue.twitter_handle} https://westcornwallevents.co.uk/events/#{event.slug}"
          else
            return "#{message} https://westcornwallevents.co.uk/events/#{event.slug}"
          end
        else
          return "#{message} https://westcornwallevents.co.uk/events/#{event.slug}"
        end
      else
        return "#{message} https://westcornwallevents.co.uk/events/#{event.slug}"
      end
    else
      return "Later Today - https://westcornwallevents.co.uk/events/#{event.slug}"
    end
  end

  def self.google_message(event)
    return "Today's Event: #{event.title} https://westcornwallevents.co.uk/events/#{event.slug}"
  end

  def self.facebook_message(event)
    return "Today's Event: #{event.title} https://westcornwallevents.co.uk/events/#{event.slug}"
  end
end
