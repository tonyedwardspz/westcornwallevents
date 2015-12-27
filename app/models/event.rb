class Event < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image_link, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :festival
  belongs_to :venue
  belongs_to :event_user
  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :venue, presence: true, unless: :location?
  validates :location, presence: true, unless: :venue?
  scope :by_month_year, -> (month, year) {where('extract(month from date) = ?', month).where('extract(year from date) = ?', year).order('date')}

  def self.create_from_user_event(user_event)
     e = new_from_user_event(user_event)
     e.save!
     e
  end

  def self.new_from_user_event(user_event)
    event = Event.new
    event.title = user_event.title.squish
    event.date = user_event.date
    event.dateend = user_event.end_date
    event.time = user_event.time
    event.time_end = user_event.time_end
    event.linktitle = user_event.title.squish
    event.description = user_event.description

    if user_event.link.present?
      if user_event.link.start_with?("www.")
        event.link = user_event.link.prepend("http://").squish
      else
        event.link = user_event.link.squish
      end
    end

    if user_event.location.length > 0
      event.location = user_event.location.squish
    end

    if user_event.venue.present?
      event.venue = user_event.venue
    end

    if user_event.image.present?
      event.image_link = user_event.image
      event.image_link.recreate_versions!
      event.imageAlt = user_event.title
    end
    user_event.archived = true
    user_event.save!
    return event
  end
end
