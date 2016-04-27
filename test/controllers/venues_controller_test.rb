require "test_helper"

class VenuesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @venue = FactoryGirl.create(:venue)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  test 'should get show view' do
    get :show, id: @venue
    assert_response :success
  end
end
