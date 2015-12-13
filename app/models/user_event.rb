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
end
