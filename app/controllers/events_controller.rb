class EventsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_event, only: [:show]

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
      @events = Event.where('date > ?', DateTime.now).order('date').limit(5)
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
      @image_meta_url = "http://westcornwallevents.co.uk"
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
            event.image_link = event.image_link.prepend("http://")
          else
            event.image_link = event.image_link.prepend("http://www.westcornwallevents.co.uk/images/")
          end
        end
      end
  end
end
