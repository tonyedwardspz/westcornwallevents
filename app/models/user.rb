class User < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true, uniqueness: true
  after_destroy :ensure_an_admin_remains
  has_many :blogs

  private
    def ensure_an_admin_remians
      if User.count.zero?
        raise "Can't delete user"
      end
    end
end
