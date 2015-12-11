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
    puts "event image link"
    inspect @image_event
    puts @user_event.image
    puts "event image link"
  end

  def edit
    @event = Event.event_from_user_event(@user_event)
    @event.save!

    if EventUser.where(email: @user_event.user_email).empty?
      event_user = EventUser.new
      event_user.first_name = @user_event.first_name
      event_user.last_name = @user_event.last_name
      event_user.email = @user_event.user_email
      event_user.subscribed = @user_event.add_to_mailling_list
      event_user.events << @event
      if event_user.save!
        puts "Event user saved: #{event_user.email}"
      end
    else
      event_user = EventUser.where("email = ?", @user_event.user_email).first
      event_user.events << @event
      event_user.save!
    end

    @user_event.destroy!
  end


  def destroy
    @user_event.destroy
    respond_to do |format|
      format.html { redirect_to admin_user_events_url, notice: 'User event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    puts "User event update"
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
