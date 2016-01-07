class Admin::BlogsController < Admin::AdminAreaController
before_action :set_admin_blog, only: [:show, :edit, :update, :destroy]

  # GET /admin/blogs
  # GET /admin/blogs.json
  def index
    @admin_blogs = Blog.all
    @page_title = "Blog Posts"
  end

  # GET /admin/blogs/1
  # GET /admin/blogs/1.json
  def show
    @page_title = @admin_blog.title
  end

  # GET /admin/blogs/new
  def new
    @admin_blog = Blog.new
    @page_title = "New blog"
  end

  # GET /admin/blogs/1/edit
  def edit
    @page_title = "Edit: #{@admin_blog.title}"
  end

  # POST /admin/blogs
  # POST /admin/blogs.json
  def create
    @admin_blog = Blog.new(admin_blog_params)

    respond_to do |format|
      if @admin_blog.save
        format.html { redirect_to admin_blog_path(@admin_blog), notice: 'Blog was successfully saved' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/blogs/1
  # PATCH/PUT /admin/blogs/1.json
  def update
    respond_to do |format|
      if @admin_blog.update(admin_blog_params)
        format.html { redirect_to admin_blog_path(@admin_blog), notice: 'blog was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/blogs/1
  # DELETE /admin/blogs/1.json
  def destroy
    @admin_blog.destroy
    respond_to do |format|
      format.html { redirect_to admin_blogs_url, notice: 'blog was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_blog
      @admin_blog = Blog.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_blog_params
      params.require(:blog).permit(:title, :content, :date_published, :image, :image_cache, :image_alt, :description, :published, :slug, :snippet, :user_id, :event_ids => [])
    end
end
