class Event < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image_link, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :festival
  belongs_to :venue
  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true

  def self.event_from_user_event(user_event)
    event = Event.new
    event.title = user_event.title
    event.date = user_event.date
    event.dateend = user_event.end_date
    event.location = user_event.location
    event.link = user_event.link
    event.time = user_event.time
    event.time_end = user_event.time_end
    event.linktitle = user_event.title
    event.description = user_event.description

    if user_event.image.present?
      event.image_link = user_event.image
      event.image_link.recreate_versions!
      # event.image_link.save
      event.imageAlt = user_event.title
    end
    return event
  end
end
