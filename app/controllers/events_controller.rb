class EventsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_event, only: [:show]

  # GET /events
  # GET /events.json
  def index
    if params[:days]
      if params[:days] == '7'
        @events =  Event.next_seven_days
        @page_title = "Next 7 Days of events and festivals"
      elsif params[:days] == '30'
        @events = Event.next_thirty_days
        @page_title = "Next 30 Days of events and festivals"
      end
    elsif params[:month] && params[:year]
      month = Date::MONTHNAMES.index(params[:month])
      @events = Event.by_month_year(month, params[:year])
      @page_title = "#{params[:month]} #{params[:year]} Events | West Cornwall Events"
    elsif params[:year]
      if params[:year] > Time.now.year.to_s
        @events = Event.by_year(params[:year])
      else
        @events = Event.by_month_year(Time.now.month, params[:year])
      end
      @page_title = "#{params[:year]} events and festivals"
    else
      @events = Event.future
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
    if @event.image_link.present?
      @image_meta_url = "https://westcornwallevents.co.uk"
      @image_meta_url << @event.image_link.thumb.to_s
    end
    @page_meta_description = @event.description
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
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :time_end, :more_link, :moreTitle, :description, :description2, :description3, :description4, :image_link, :image_link_cache, :imageAlt, :festival_id, :venue_id)
    end

    def event_params_without_image
      params.require(:event).permit(:date, :dateend, :title, :location, :link, :linktitle, :time, :time_end, :more_link, :moreTitle, :description, :description2, :description3, :description4, :image_link, :image_link_cache, :imageAlt, :festival_id, :venue_id)
    end

    def prepareURLString (event)
      if event.image_link.instance_of? String
        startString = event.image_link[0,4].downcase
        if startString != "http"
          if startString == "www."
            event.image_link = event.image_link.prepend("https://")
          else
            event.image_link = event.image_link.prepend("https://westcornwallevents.co.uk/images/")
          end
        end
      end
  end
end
