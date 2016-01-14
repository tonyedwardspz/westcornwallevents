class Admin::CategoriesController < Admin::AdminAreaController
  def index
    @categories = Category.all
    @page_title = "View all Event Users"
  end

  def new
    @category = Category.new
    @page_title = "New Event User"
  end

  def edit
    @page_title = "Edit Event User"
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_category_path(@category), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_category_path(@category), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @category.destroy!
    respond_to do |format|
      format.html { redirect_to admin_category_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category
      @category = Category.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name, :description)
    end
end

end
