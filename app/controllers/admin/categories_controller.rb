class Admin::CategoriesController < Admin::AdminAreaController
  before_action :set_category, only: [:edit, :update, :destroy]

  def index
    @categories = Category.all
    @page_title = "View all categories"
  end

  def new
    @category = Category.new
    @page_title = "New Category"
  end

  def edit
    @page_title = "Edit Category"
  end

  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_path, notice: 'Category was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to admin_categories_path , notice: 'Category was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end


  def destroy
    @category.destroy!
    respond_to do |format|
      format.html { redirect_to admin_categories_path , notice: 'Category was successfully destroyed.' }
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
