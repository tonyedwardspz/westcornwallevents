require "test_helper"

class Admin::UserTest < ActiveSupport::TestCase

  def user
    @user ||= Admin::User.new
  end

  def test_valid
    assert user.valid?
  end

end
