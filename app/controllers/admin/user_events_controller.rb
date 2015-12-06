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

  def edit
    @event = Event.new
    @event.title = @user_event.title
    @event.date = @user_event.date
    @event.dateend = @user_event.end_date
    @event.location = @user_event.location
    @event.link = @user_event.link
    @event.description = @user_event.description
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully added.' }
      else
        format.html { render :edit }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event
      @user_event = UserEvent.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :more_link, :moreTitle, :description, :description2, :description3, :description4, :image_link, :imageAlt, :festival_id, :venue_id)
    end
end
