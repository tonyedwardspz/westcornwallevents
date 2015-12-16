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

  # GET /events/1
  # GET /events/1.json
  def show
    @page_title = @event.title
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
        expire_venue_cache()
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
      if @event.image_link_change
        if @event.update(event_params)
          expire_venue_cache()
          format.html { redirect_to admin_event_path(@event), notice: 'Event was successfully updated.' }
        else
          format.html { render :edit }
        end
      elsif @event.update(event_params_without_image)
        expire_venue_cache()
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

  def reprocess_images
    events = Event.where.not(image_link: 'nil')
    begin
      events.each { |e|
        e.image_link.recreate_versions!
      }
    rescue => e
      logger.warn "WARN: Image reprocess - #{e}"
    end
    redirect_to admin_events_url, notice: 'Images successfully reprocessed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :time_end, :more_link, :moreTitle, :description, :description2, :description3, :description4, :image_link, :image_link_cache, :imageAlt, :festival_id, :venue_id)
    end

    def expire_venue_cache
      if @event.venue.present?
        expire_fragment('venue_#{@event.venue.name}_events')
      end
    end
end
