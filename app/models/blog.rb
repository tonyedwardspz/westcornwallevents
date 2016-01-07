class Blog < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
  belongs_to :user
  has_and_belongs_to_many :events
end
