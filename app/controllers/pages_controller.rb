class PagesController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_page, only: [:show, :edit, :update, :destroy]

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

  # GET /pages/new
  def new
    @page = Page.new
    @page_title = "New page"
  end

  # GET /pages/1/edit
  def edit
    @page_title = "Edit page: #{@page.title}"
  end

  # POST /pages
  # POST /pages.json
  def create
    @page = Page.new(page_params)

    respond_to do |format|
      if @page.save
        format.html { redirect_to admin_page_path(@page), notice: 'Page was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /pages/1
  # PATCH/PUT /pages/1.json
  def update
    respond_to do |format|
      if @page.update(page_params)
        format.html { redirect_to admin_page_path(@page), notice: 'Page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.json
  def destroy
    @page.destroy
    respond_to do |format|
      format.html { redirect_to admin_page_path, notice: 'Page was successfully destroyed.' }
    end
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
