require "test_helper"

class Admin::EventsControllerTest < ActionController::TestCase
  def test_index
    get :index
    assert_response :success
  end

end
