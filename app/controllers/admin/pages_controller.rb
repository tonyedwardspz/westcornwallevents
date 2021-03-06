class Admin::PagesController < Admin::AdminAreaController
  before_action :set_admin_page, only: [:show, :edit, :update, :destroy]

  # GET /admin/pages
  # GET /admin/pages.json
  def index
    @admin_pages = Page.all
    @page_title = "View Pages"
  end

  # GET /admin/pages/1
  # GET /admin/pages/1.json
  def show
    @page_title = @admin_page.title
  end

  # GET /admin/pages/new
  def new
    @admin_page = Page.new
    @page_title = "New Page"
  end

  # GET /admin/pages/1/edit
  def edit
    @page_title = "Edit Page: #{@admin_page.title}"
  end

  # POST /admin/pages
  # POST /admin/pages.json
  def create
    @admin_page = Page.new(admin_page_params)

    respond_to do |format|
      if @admin_page.save
        format.html { redirect_to admin_page_path(@admin_page), notice: 'Page was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/pages/1
  # PATCH/PUT /admin/pages/1.json
  def update
    respond_to do |format|
      if @admin_page.update(admin_page_params)
        format.html { redirect_to admin_page_path(@admin_page), notice: 'Page was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/pages/1
  # DELETE /admin/pages/1.json
  def destroy
    @admin_page.destroy
    respond_to do |format|
      format.html { redirect_to admin_pages_url, notice: 'Page was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_page
      @admin_page = Page.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_page_params
      params.require(:page).permit(:title, :slug, :content)
    end
end
