require "test_helper"

class VenuesControllerTest < ActionController::TestCase

  def venue
    @venue ||= venues :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:venues)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Venue.count') do
      post :create, venue: { address: venue.address, content: venue.content, email: venue.email, image: venue.image, image_alt: venue.image_alt, name: venue.name, phone: venue.phone, postcode: venue.postcode, title: venue.title, url: venue.url }
    end

    assert_redirected_to venue_path(assigns(:venue))
  end

  def test_show
    get :show, id: venue
    assert_response :success
  end

  def test_edit
    get :edit, id: venue
    assert_response :success
  end

  def test_update
    put :update, id: venue, venue: { address: venue.address, content: venue.content, email: venue.email, image: venue.image, image_alt: venue.image_alt, name: venue.name, phone: venue.phone, postcode: venue.postcode, title: venue.title, url: venue.url }
    assert_redirected_to venue_path(assigns(:venue))
  end

  def test_destroy
    assert_difference('Venue.count', -1) do
      delete :destroy, id: venue
    end

    assert_redirected_to venues_path
  end
end
