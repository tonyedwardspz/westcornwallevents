class EventsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    if params[:month] && params[:year]
      month = Date::MONTHNAMES.index(params[:month])
      @events = Event.where('extract(month from date) = ?', month).where('extract(year from date) = ?', params[:year]).order('date')
      @page_title = "#{params[:month]} #{params[:year]} Events | West Cornwall Events"
    elsif params[:year]
      if params[:year] > Time.now.year.to_s
        @events = Event.where('extract(year from date) = ?', params[:year]).limit(5)
      else
        @events = Event.where('extract(year from date) = ?', params[:year]).where('date > ?', DateTime.now).order('date').limit(5)
      end
      @page_title = "#{params[:year]} events and festivals"
    else
      @events = Event.where('date > ?', DateTime.now).order('date')
      @page_title = "Upcoming events and festivals"
    end

    for event in @events
      if event.image_link.present?
        prepareURLString(event)
      end
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @page_title = @event.title
  end

  # GET /events/new
  def new
    @page_title = "Create a new festival"
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
    @page_title = "Edit festival #{@event.title}"
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.image_link_change
        if @event.update(event_params)
          format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }
        else
          format.html { render :edit }
        end
      elsif @event.update(event_params_without_image)
        format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }
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
      @event = Event.friendly.find(params[:id])
      if @event.image_link.present?
        prepareURLString(@event)
      end
      return @event
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :more_link, :moreTitle, :description, :description2, :description3, :description4, :image_link, :imageAlt, :festival_id, :venue_id)
    end

    def event_params_without_image
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :more_link, :moreTitle, :description, :description2, :description3, :description4, :image_link, :imageAlt, :festival_id, :venue_id)
    end

    def prepareURLString (event)
      if event.image_link.instance_of? String
        startString = event.image_link[0,4].downcase
        if startString != "http"
          if startString == "www."
            event.image_link = event.image_link.prepend("http://")
          else
            event.image_link = event.image_link.prepend("http://www.westcornwallevents.co.uk/images/")
          end
        end
      end
  end
end
