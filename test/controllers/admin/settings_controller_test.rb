require "test_helper"

class Admin::SettingsControllerTest < ActionController::TestCase
  def test_general
    get :general
    assert_response :success
  end

  def test_adminUsers
    get :adminUsers
    assert_response :success
  end

end
