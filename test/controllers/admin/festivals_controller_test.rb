require "test_helper"

class Admin::FestivalsControllerTest < ActionController::TestCase

  def admin_festival
    @admin_festival ||= admin_festivals :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_festivals)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Admin::Festival.count') do
      post :create, admin_festival: {  }
    end

    assert_redirected_to admin_festival_path(assigns(:admin_festival))
  end

  def test_show
    get :show, id: admin_festival
    assert_response :success
  end

  def test_edit
    get :edit, id: admin_festival
    assert_response :success
  end

  def test_update
    put :update, id: admin_festival, admin_festival: {  }
    assert_redirected_to admin_festival_path(assigns(:admin_festival))
  end

  def test_destroy
    assert_difference('Admin::Festival.count', -1) do
      delete :destroy, id: admin_festival
    end

    assert_redirected_to admin_festivals_path
  end
end
