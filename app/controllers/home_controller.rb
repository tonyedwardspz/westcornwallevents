class HomeController < ApplicationController
  skip_before_action :authorize, only: [:index]
  def index
    @page_title = 'Your local events calendar'
  end
end
