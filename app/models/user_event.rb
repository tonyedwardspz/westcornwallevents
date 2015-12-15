class UserEvent < ActiveRecord::Base
  mount_uploader :image, UsereventAttachmentUploader
  belongs_to :event_user
  belongs_to :venue

  validates :title, presence: true
  validates :date, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_email, presence: true
  validates_format_of :user_email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, :message => "email does not appear to be valid"
  validates :venue, presence: true, unless: :location?
  validates :location, presence: true, unless: :venue?

  def location?
    self.location.present?
  end

  def venue?
    self.venue.present?
  end
end
