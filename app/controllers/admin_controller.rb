class AdminController < ApplicationController
  def index
    @total_events = Event.count
    @new_events = 13
  end
end
