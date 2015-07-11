class AdminController < ApplicationController
  def index
    @total_events = Event.count
  end
end
