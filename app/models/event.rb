 class Event < ActiveRecord::Base
  extend FriendlyId
  include PgSearch
  multisearchable :against => [:title, :description, :description2, :description3, :location]
  mount_uploader :image_link, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :festival
  belongs_to :venue
  belongs_to :event_user
  has_and_belongs_to_many :blogs
  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true
  validates :venue, presence: true, unless: :location?
  validates :location, presence: true, unless: :venue_id?
  validates :imageAlt, presence: true, if: "image_link.present?"
  validates :moreTitle, presence: true, if: "more_link.present?"
  validates :linktitle, presence: true, if: "link.present?"
  scope :by_month_year, -> (month, year) {where('extract(month from date) = ?', month).where('extract(year from date) = ?', year).order('date')}
  scope :by_year, -> (year) {where('extract(year from date) = ?', year).limit(5)}
  scope :by_year_future, -> (year) {where('extract(year from date) = ?', year).where('date > ?', DateTime.now).order('date').limit(5)}
  scope :future, -> {where('date > ?', DateTime.now).order('date').limit(5)}
  scope :all_future, -> {where('date > ?', DateTime.now).order('date')}
  scope :homepage, -> {where('date > ?', DateTime.now).where.not(image_link: 'nil').order('date').limit(6)}
  scope :next_thirty_days, -> {where('date > ?', DateTime.now).where('date < ?', (DateTime.now + 30.days)).order('date')}

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
