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
    @page_title = "Create new festival"
  end

  # GET /festivals/1/edit
  def edit
    @page_title = "Edit festival: #{@festival.title}"
  end

  # POST /festivals
  # POST /festivals.json
  def create
    @festival = Festival.new(festival_params)

    respond_to do |format|
      if @festival.save
        format.html { redirect_to admin_festival_path(:id => @festival.id), notice: 'Festival was successfully created.' }
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
        format.html { redirect_to admin_festival_url(:id => @festival.id), notice: 'Festival was successfully updated.' }
      else
        format.html { redirect_to edit_admin_festival_path(@festival) }
      end
    end
  end

  # DELETE /festivals/1
  # DELETE /festivals/1.json
  def destroy
    @festival.destroy
    respond_to do |format|
      format.html { redirect_to admin_festival_url, notice: 'Festival was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival
      @festival = Festival.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def festival_params
      params.require(:festival).permit(:title, :date, :end_date, :content, :image, :image_alt, :image2, :image2_alt, :video1, :video2, :meta_title, :meta_description, :summary, :snippet)
    end
end
