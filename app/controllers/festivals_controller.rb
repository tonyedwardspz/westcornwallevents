class FestivalsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_festival, only: [:show, :edit, :update, :destroy]

  # GET /festivals
  # GET /festivals.json
  def index
    @festivals = Festival.all
    @page_title = "Annual festivals and events accross West Cornwall"
  end

  # GET /festivals/1
  # GET /festivals/1.json
  def show
    @page_title = @festival.title
  end

  # GET /festivals/new
  def new
    @festival = Festival.new
  end

  # GET /festivals/1/edit
  def edit
  end

  # POST /festivals
  # POST /festivals.json
  def create
    @festival = Festival.new(festival_params)

    respond_to do |format|
      if @festival.save
        format.html { redirect_to admin_festival_path(@festival), notice: 'Festival was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /festivals/1
  # PATCH/PUT /festivals/1.json
  def update
    respond_to do |format|
      if @festival.update(festival_params)
        format.html { redirect_to admin_festival_path(@festival), notice: 'Festival was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /festivals/1
  # DELETE /festivals/1.json
  def destroy
    @festival.destroy
    respond_to do |format|
      format.html { redirect_to admin_festivals_url, notice: 'Festival was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival
      @festival = Festival.friendly.find(params[:id])
      if @festival.image.present?
        startString = @festival.image[0,4].downcase
        if startString != "http"
          if startString == "www."
            @festival.image = @festival.image.prepend("http://")
          elsif startString[0,1] == "/"
            @festival.image = @festival.image.prepend("http://www.westcornwallevents.co.uk/images")
          else
            @festival.image = @festival.image.prepend("http://www.westcornwallevents.co.uk/images/")
          end
        end
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def festival_params
      params.require(:festival).permit(:title, :date, :date_end, :content, :image, :image_alt, :image2, :image2_alt, :video1, :video2, :meta_title, :meta_description, :summary, :snippet)
    end
end
