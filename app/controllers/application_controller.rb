class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  $sidebar_events = Event.future
  $upcoming_festivals = Festival.where('date > ?', DateTime.now).order('date').limit(1)
  $recent_additions = Event.all.order('updated_at DESC').limit(6)

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end

  protected
  def authorize
    unless User.find_by(id: session[:user_id])
      redirect_to login_url, notice: "Please log in"
    end
  end

end
