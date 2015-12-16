class HomeController < ApplicationController
  skip_before_action :authorize, only: [:index]
  def index
    @page_title = 'Your local events calendar'
    @home_events = Event.where.not(image_link: 'nil').limit(6)
  end
end
