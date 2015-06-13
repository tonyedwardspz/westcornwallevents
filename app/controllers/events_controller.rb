class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index

    if params[:month] && params[:year]
      month = Date::MONTHNAMES.index(params[:month])
      @events = Event.where('extract(month from date) = ?', month).where('extract(year from date) = ?', params[:year]).order('date')
      @page_title = "#{params[:month]} #{params[:year]} Events"
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
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params[:date, :dateend, :title, :location, :link, :linktitle, :time, :more_link, :moreTitle, :description, :description2, :description3, :image_link, :imageAlt]
    end
end
