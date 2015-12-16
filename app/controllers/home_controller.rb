class HomeController < ApplicationController
  skip_before_action :authorize, only: [:index]
  def index
    @page_title = 'Your local events calendar'
    @home_events = Event.where('date > ?', DateTime.now).where.not(image_link: 'nil').order('date').limit(6)
  end
end
