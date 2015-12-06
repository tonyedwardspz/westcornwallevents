class Admin::UserEventsController < Admin::AdminAreaController
  before_action :set_user_event, only: [:show, :edit, :update, :destroy]

  def index
    @user_events = UserEvent.all.order('date DESC')
    @page_title = "View User Events"
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @page_title = @user_event.title
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event
      @user_event = UserEvent.find(params[:id])
    end
end
