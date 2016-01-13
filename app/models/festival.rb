class Festival < ActiveRecord::Base
  extend FriendlyId
  include PgSearch
  multisearchable :against => [:title, :content, :meta_description, :summary, :snippet]
  friendly_id :title, use: [:slugged, :finders]
  mount_uploader :image, AttachmentUploader
  mount_uploader :image2, AttachmentUploader
  has_many :events
  has_and_belongs_to_many :blogs
  validates :title, presence: true
  validates :date, presence: true
  validates :meta_title, presence: true
  validates :meta_description, presence: true
  validates :snippet, presence: true
  validates :summary, presence: true
  validates :image_alt, presence: true, if: "image.present?"
  validates :image_alt2, presence: true, if: "image2.present?"
end
