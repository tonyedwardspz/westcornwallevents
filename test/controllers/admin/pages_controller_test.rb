require "test_helper"

class Admin::PagesControllerTest < ActionController::TestCase

  def admin_page
    @admin_page ||= admin_pages :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:admin_pages)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Admin::Page.count') do
      post :create, admin_page: {  }
    end

    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  def test_show
    get :show, id: admin_page
    assert_response :success
  end

  def test_edit
    get :edit, id: admin_page
    assert_response :success
  end

  def test_update
    put :update, id: admin_page, admin_page: {  }
    assert_redirected_to admin_page_path(assigns(:admin_page))
  end

  def test_destroy
    assert_difference('Admin::Page.count', -1) do
      delete :destroy, id: admin_page
    end

    assert_redirected_to admin_pages_path
  end
end
