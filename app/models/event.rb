class Event < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image_link, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :festival
  belongs_to :venue
  validates :title, presence: true, uniqueness: true
  validates :date, presence: true
  validates :description, presence: true
end
