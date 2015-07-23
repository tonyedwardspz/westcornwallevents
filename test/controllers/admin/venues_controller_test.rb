require "test_helper"

class Admin::VenuesControllerTest < ActionController::TestCase

  def admin_venue
    @admin_venue ||= admin_venues :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_venues)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Admin::Venue.count') do
      post :create, admin_venue: {  }
    end

    assert_redirected_to admin_venue_path(assigns(:admin_venue))
  end

  def test_show
    get :show, id: admin_venue
    assert_response :success
  end

  def test_edit
    get :edit, id: admin_venue
    assert_response :success
  end

  def test_update
    put :update, id: admin_venue, admin_venue: {  }
    assert_redirected_to admin_venue_path(assigns(:admin_venue))
  end

  def test_destroy
    assert_difference('Admin::Venue.count', -1) do
      delete :destroy, id: admin_venue
    end

    assert_redirected_to admin_venues_path
  end
end
