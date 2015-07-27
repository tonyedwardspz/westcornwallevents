class Admin::FestivalsController < Admin::AdminAreaController
  before_action :set_admin_festival, only: [:show, :edit, :update, :destroy]

  # GET /admin/festivals
  # GET /admin/festivals.json
  def index
    @admin_festivals = Festival.all
    @page_title = "Festival"
  end

  # GET /admin/festivals/1
  # GET /admin/festivals/1.json
  def show
    @page_title = @admin_festival.title
  end

  # GET /admin/festivals/new
  def new
    @admin_festival = Festival.new
    @page_title = "New Festival"
  end

  # GET /admin/festivals/1/edit
  def edit
    @page_title = "Edit Event: #{@admin_festival.title}"
  end

  # POST /admin/festivals
  # POST /admin/festivals.json
  def create
    @admin_festival = Festival.new(admin_festival_params)
    @admin_festival = Event.new(event_params)
    @admin_festival.date = @admin_festival.date.strftime("%m/%d/%Y")
    if @admin_festival.end_date.present?
      @admin_festival.end_date = @admin_festival.end_date.strftime("%m/%d/%Y")
    end

    respond_to do |format|
      if @admin_festival.save
        format.html { redirect_to @admin_festival, notice: 'Festival was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/festivals/1
  # PATCH/PUT /admin/festivals/1.json
  def update
    respond_to do |format|
      if @admin_festival.update(admin_festival_params)
        format.html { redirect_to @admin_festival, notice: 'Festival was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/festivals/1
  # DELETE /admin/festivals/1.json
  def destroy
    @admin_festival.destroy
    respond_to do |format|
      format.html { redirect_to admin_festivals_url, notice: 'Festival was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_festival
      @admin_festival = Festival.find(params[:id])
      if @admin_festival.image.present?
        startString = @admin_festival.image[0,4].downcase
        if startString != "http"
          if startString == "www."
            @admin_festival.image = @admin_festival.image.prepend("http://")
          else
            @admin_festival.image = @admin_festival.image.prepend("http://www.westcornwallevents.co.uk/images/")
          end
        end
      end
      return @admin_festival
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_festival_params
      params.require(:festival).permit(:title, :date, :end_date, :content, :image, :image_alt, :image2, :image2_alt, :video1, :video2, :meta_title, :meta_description, :summary, :snippet)
    end
end
