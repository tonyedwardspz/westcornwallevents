class Blog < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :user
  has_and_belongs_to_many :festivals
  has_and_belongs_to_many :events
  validates_length_of :events, maximum: 3
  validates_length_of :festivals, maximum: 1
  validates :title, presence: true
  validates :content, presence: true
  validates :date_published, presence: true
  validates :image_alt, presence: true, if: "image.present?"
  validates :description, presence: true
  validates :snippet, presence: true
  scope :published, -> {where('date_published <= ?', DateTime.now).where('published = ?', true).order('date_published DESC')}
end
