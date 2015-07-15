require "test_helper"

class Admin::UsersControllerTest < ActionController::TestCase

  def admin_user
    @admin_user ||= admin_users :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_users)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Admin::User.count') do
      post :create, admin_user: {  }
    end

    assert_redirected_to admin_user_path(assigns(:admin_user))
  end

  def test_show
    get :show, id: admin_user
    assert_response :success
  end

  def test_edit
    get :edit, id: admin_user
    assert_response :success
  end

  def test_update
    put :update, id: admin_user, admin_user: {  }
    assert_redirected_to admin_user_path(assigns(:admin_user))
  end

  def test_destroy
    assert_difference('Admin::User.count', -1) do
      delete :destroy, id: admin_user
    end

    assert_redirected_to admin_users_path
  end
end
