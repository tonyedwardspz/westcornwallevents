class VenuesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_venue, only: [:show]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all.order('name')
    @page_title = "Event venues around Cornwall"
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @page_title = @venue.name
    @venue_events = @venue.events.where('date >= ?', DateTime.now).order('date').limit(5).includes(:festival)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:title, :name, :phone, :email, :url, :LinkAlt, :address, :postcode, :image, :image_cache, :image_alt, :content)
    end
end
