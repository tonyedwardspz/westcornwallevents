class BlogsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]
  before_action :set_blog, only: [:show]

  def index
    @blogs = Blog.all
    @page_title = "Blog Posts"
  end

  def show
    @page_title = @blog.title
    if @blog.image.present?
      @image_meta_url = "https://westcornwallevents.co.uk"
      @image_meta_url << @blog.image.to_s
    end
    @page_meta_description = @blog.description
  end

  private
    def set_blog
      @blog = Blog.friendly.find(params[:id])
    end

    def blog_params
      params.require(:blog).permit(:title, :content, :date_published, :image, :image_cache, :image_alt, :description, :published, :slug)
    end
end
