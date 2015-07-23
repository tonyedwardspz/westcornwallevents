class Admin::EventsController < Admin::AdminAreaController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.all.order('date DESC')
    @page_title = "View Events"
  end

  # GET /events/new
  def new
    @page_title = "Create a new event"
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @page_title = "Edit Event: #{@event.title}"
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.date = @event.date.strftime("%m/%d/%Y")
    if @event.dateend.present?
      @event.dateend = @event.dateend.strftime("%m/%d/%Y")
    end

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to admin_events_url, notice: 'Event was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :more_link, :moreTitle, :description, :description2, :description3, :image_link, :imageAlt, :festival_id, :venue_id)
    end
end
