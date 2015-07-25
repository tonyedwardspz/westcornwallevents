require "test_helper"

class PagesControllerTest < ActionController::TestCase

  def page
    @page ||= pages :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:pages)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference('Page.count') do
      post :create, page: { content: page.content, slug: page.slug, title: page.title }
    end

    assert_redirected_to page_path(assigns(:page))
  end

  def test_show
    get :show, id: page
    assert_response :success
  end

  def test_edit
    get :edit, id: page
    assert_response :success
  end

  def test_update
    put :update, id: page, page: { content: page.content, slug: page.slug, title: page.title }
    assert_redirected_to page_path(assigns(:page))
  end

  def test_destroy
    assert_difference('Page.count', -1) do
      delete :destroy, id: page
    end

    assert_redirected_to pages_path
  end
end
