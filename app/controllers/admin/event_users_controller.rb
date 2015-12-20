  class Admin::EventUsersController < Admin::AdminAreaController
  before_action :set_event_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @event_users = EventUser.all
    @page_title = "View all Event Users"
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    @page_title = "View Event User"
  end

  # GET /admin/users/new
  def new
    @event_user = EventUser.new
    @page_title = "New Event User"
  end

  # GET /admin/users/1/edit
  def edit
    @page_title = "Edit Event User"
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @event_user = EventUser.new(event_user_params)

    respond_to do |format|
      if @event_user.save
        format.html { redirect_to admin_event_user_path(@event_user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @event_user.update(event_user_params)
        format.html { redirect_to admin_event_user_path(@event_user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @event_user.destroy!
    respond_to do |format|
      format.html { redirect_to admin_event_users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_user
      @event_user = EventUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_user_params
      params.require(:event_user).permit(:first_name, :last_name, :user_email, :subscribed)
    end
end
