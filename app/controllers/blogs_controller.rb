class BlogsController < ApplicationController
  skip_before_action :authorize, only: [:index, :show]

  # GET /festivals
  # GET /festivals.json
  def index
    @blogs = Blog.all.order('date_published DESC')
    @page_title = "Blog Posts"
  end

  # GET /festivals/1
  # GET /festivals/1.json
  def show
    @page_title = @blog.title
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_blog
      @blog = Blog.find(params[:id])
    end
end
