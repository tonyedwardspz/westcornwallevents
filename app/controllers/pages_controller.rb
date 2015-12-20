class PagesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_page, only: [:show]

  # GET /pages
  # GET /pages.json
  def index
    @pages = Page.all
    @page_title = "All pages"
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    @page_title = @page.title
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :slug, :content)
    end
end
