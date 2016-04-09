class SessionsController < ApplicationController
  skip_before_action :authorize
  def new
    @page_title = "Login"
  end

  def create
    user = User.find_by(name: params[:name])

    # if verify_recaptcha(model: @user_event)
      if user and user.try(:authenticate, params[:password])
        session[:user_id] = user.id
        redirect_to admin_url
      else
        redirect_to login_url, alert: "Invalid user/password combination"
      end
    # else
      # redirect_to login_url, alert: "Confirm you are human"
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/", notice: "Logged out"
  end

  private
    def session_params
      params.require(:session).permit(:name, :password, :authenticity_token)
    end
end
