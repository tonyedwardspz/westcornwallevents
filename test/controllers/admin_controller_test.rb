require "test_helper"

class AdminControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
