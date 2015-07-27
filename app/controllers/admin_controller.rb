class AdminController < ApplicationController
  def index
    @total_events = Event.count
    @total_future_events = Event.where("date >= ?", Date.today).count
    @total_venues = Venue.count
    @total_festivals =Festival.count
    @total_pages = Page.count
    @total_users = User.count
    @recently_added_events = Event.order('updated_at DESC').limit(10)
    @new_events = 13
    @page_title = "Admin | West Cornwall Events"
  end
end
