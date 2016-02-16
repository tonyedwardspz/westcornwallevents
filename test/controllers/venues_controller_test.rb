require "test_helper"

class VenuesControllerTest < ActionController::TestCase

  let(:venue) { FactoryGirl.create(:venue) }

  def test_index
    venue

    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end


  def test_show
    get :show, id: venue
    assert_response :success
  end
end
