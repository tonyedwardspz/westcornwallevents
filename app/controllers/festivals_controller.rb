class FestivalsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_festival, only: [:show]

  # GET /festivals
  # GET /festivals.json
  def index
    @festivals = Festival.all.order('date DESC')
    @page_title = "Annual festivals and events accross West Cornwall"
  end

  # GET /festivals/1
  # GET /festivals/1.json
  def show
    @page_title = @festival.title
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_festival
      @festival = Festival.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def festival_params
      params.require(:festival).permit(:title, :date, :end_date, :content, :image, :image_cache, :image_alt, :image2, :image2_cache, :image2_alt, :video1, :video2, :meta_title, :meta_description, :summary, :snippet)
    end
end
