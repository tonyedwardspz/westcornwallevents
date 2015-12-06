class UserEvent < ActiveRecord::Base
  mount_uploader :image, UsereventAttachmentUploader

  validates :title, presence: true
  validates :date, presence: true
  validates :location, presence: true
  validates :time, presence: true
  validates :description, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :user_email, presence: true
end
