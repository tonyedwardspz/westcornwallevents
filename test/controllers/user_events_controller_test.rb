require "test_helper"

class UserEventsControllerTest < ActionController::TestCase
  def user_event
    @user_event ||= user_events :one
  end

  def test_index
    get :index
    assert_response :success
    assert_not_nil assigns(:user_events)
  end

  def test_new
    get :new
    assert_response :success
  end

  def test_create
    assert_difference("UserEvent.count") do
      post :create, user_event: { date: user_event.date, description: user_event.description, end_date: user_event.end_date, image: user_event.image, link: user_event.link, location: user_event.location, time: user_event.time, title: user_event.title }
    end

    assert_redirected_to user_event_path(assigns(:user_event))
  end

  def test_show
    get :show, id: user_event
    assert_response :success
  end

  def test_edit
    get :edit, id: user_event
    assert_response :success
  end

  def test_update
    put :update, id: user_event, user_event: { date: user_event.date, description: user_event.description, end_date: user_event.end_date, image: user_event.image, link: user_event.link, location: user_event.location, time: user_event.time, title: user_event.title }
    assert_redirected_to user_event_path(assigns(:user_event))
  end

  def test_destroy
    assert_difference("UserEvent.count", -1) do
      delete :destroy, id: user_event
    end

    assert_redirected_to user_events_path
  end
end
