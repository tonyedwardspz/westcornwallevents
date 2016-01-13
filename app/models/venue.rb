class Venue < ActiveRecord::Base
  extend FriendlyId
  include PgSearch
  multisearchable :against => [:name, :address, :content]
  friendly_id :name,  use: [:slugged, :finders]
  mount_uploader :image, AttachmentUploader
  validates :name, presence: true
  validates :address, presence: true
  validates :postcode, presence: true
  validates :image_alt, presence: true, if: "image.present?"
  has_many :events
  has_many :user_events
  scope :is_open, -> {where(archived: 'false').order('name')}
end
