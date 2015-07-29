class Festival < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: [:slugged, :finders]
  mount_uploader :image, AttachmentUploader
  mount_uploader :image2, AttachmentUploader
  has_many :events
end
