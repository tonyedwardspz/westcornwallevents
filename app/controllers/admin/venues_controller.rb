class Admin::VenuesController < Admin::AdminAreaController
  before_action :set_admin_venue, only: [:show, :edit, :update, :destroy]

  # GET /admin/venues
  # GET /admin/venues.json
  def index
    @admin_venues = Venue.all.order('name')
    @page_title = "All Venues"
  end

  # GET /admin/venues/1
  # GET /admin/venues/1.json
  def show
    @page_title = @admin_venue.name
  end

  # GET /admin/venues/new
  def new
    @admin_venue = Venue.new
    @page_title = "New Venue"
  end

  # GET /admin/venues/1/edit
  def edit
    @page_title = "Edit: #{@admin_venue.name}"
  end

  # POST /admin/venues
  # POST /admin/venues.json
  def create
    @admin_venue = Venue.new(admin_venue_params)

    respond_to do |format|
      if @admin_venue.save
        format.html { redirect_to admin_venue_path(@admin_venue), notice: 'Venue was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/venues/1
  # PATCH/PUT /admin/venues/1.json
  def update
    respond_to do |format|
      if @admin_venue.update(admin_venue_params)
        format.html { redirect_to admin_venue_path(@admin_venue), notice: 'Venue was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/venues/1
  # DELETE /admin/venues/1.json
  def destroy
    @admin_venue.destroy
    respond_to do |format|
      format.html { redirect_to admin_venues_url, notice: 'Venue was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_venue
      @admin_venue = Venue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_venue_params
      params.require(:venue).permit(:name, :phone, :email, :url, :LinkAlt, :address, :postcode, :image, :image_cache, :image_alt, :content, :archived)
    end
end
