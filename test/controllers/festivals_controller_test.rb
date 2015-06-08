require "test_helper"

class FestivalsControllerTest < ActionController::TestCase

  def festival
    @festival ||= festivals :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:festivals)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Festival.count') do
      post :create, festival: { content: festival.content, date: festival.date, end_date: festival.end_date, image2: festival.image2, image2_alt: festival.image2_alt, image: festival.image, image_alt: festival.image_alt, meta_description: festival.meta_description, meta_title: festival.meta_title, title: festival.title, video1: festival.video1, video2: festival.video2 }
    end

    assert_redirected_to festival_path(assigns(:festival))
  end

  def test_show
    get :show, id: festival
    assert_response :success
  end

  def test_edit
    get :edit, id: festival
    assert_response :success
  end

  def test_update
    put :update, id: festival, festival: { content: festival.content, date: festival.date, end_date: festival.end_date, image2: festival.image2, image2_alt: festival.image2_alt, image: festival.image, image_alt: festival.image_alt, meta_description: festival.meta_description, meta_title: festival.meta_title, title: festival.title, video1: festival.video1, video2: festival.video2 }
    assert_redirected_to festival_path(assigns(:festival))
  end

  def test_destroy
    assert_difference('Festival.count', -1) do
      delete :destroy, id: festival
    end

    assert_redirected_to festivals_path
  end
end
