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
    @page_title = "Edit Event"
  end

  # POST /admin/festivals
  # POST /admin/festivals.json
  def create
    @admin_festival = Festival.new(admin_festival_params)

    respond_to do |format|
      if @admin_festival.save
        format.html { redirect_to @admin_festival, notice: 'Festival was successfully created.' }
        format.json { render :show, status: :created, location: @admin_festival }
      else
        format.html { render :new }
        format.json { render json: @admin_festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admin/festivals/1
  # PATCH/PUT /admin/festivals/1.json
  def update
    respond_to do |format|
      if @admin_festival.update(admin_festival_params)
        format.html { redirect_to @admin_festival, notice: 'Festival was successfully updated.' }
        format.json { render :show, status: :ok, location: @admin_festival }
      else
        format.html { render :edit }
        format.json { render json: @admin_festival.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/festivals/1
  # DELETE /admin/festivals/1.json
  def destroy
    @admin_festival.destroy
    respond_to do |format|
      format.html { redirect_to admin_festivals_url, notice: 'Festival was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_festival
      @admin_festival = Festival.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_festival_params
      params.require(:admin_festival).permit(:title, :date, :date_end, :content, :image, :image_alt, :image2, :image2_alt, :video1, :video2, :meta_title, :meta_description, :summary, :snippet)
    end
end
