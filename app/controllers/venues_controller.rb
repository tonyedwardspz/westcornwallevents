class VenuesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    @venues = Venue.all
    @page_title = "Event venues around Cornwall"
  end

  # GET /venues/1
  # GET /venues/1.json
  def show
    @page_title = @venue.name
    @venue_events = @venue.events
  end

  # GET /venues/new
  def new
    @venue = Venue.new
    @page_title = "New venue"
  end

  # GET /venues/1/edit
  def edit
    @page_title = "Edit venue"
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(venue_params)
    respond_to do |format|
      if @venue.save
        format.html { redirect_to admin_venue_url(@venue), notice: 'Venue was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to admin_venue_url(@venue), notice: 'Venue was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to admin_venue_url, notice: 'Venue was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:title, :name, :phone, :email, :url, :LinkAlt, :address, :postcode, :image, :image_alt, :content)
    end
end
