class Blog < ActiveRecord::Base
  extend FriendlyId
  mount_uploader :image, AttachmentUploader
  friendly_id :title, use: [:slugged, :finders]
end