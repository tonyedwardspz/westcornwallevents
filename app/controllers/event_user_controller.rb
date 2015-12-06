class EventUserController < ApplicationController
  before_action :set_event_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @event_user = EventUser.order(:name)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @event_user = EventUser.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @event_user = EventUser.new(event_user_params)

    respond_to do |format|
      if @event_user.save
        format.html { redirect_to event_user_path(@event_user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @event_user.update(event_user_params)
        format.html { redirect_to event_user_path(@event_user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_user }
      else
        format.html { render :edit }
        format.json { render json: @event_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    begin
      @event_user.destroy
      flash[:notice] = "User #{@event_user.name} deleted"
    rescue StandardError => e
      flash[:notice] = e.message
    end

    respond_to do |format|
      format.html { redirect_to event_users_url}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @event_user = EventUser.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def event_user_params
    params.require(:event_user).permit(:first_name, :last_name, :email)
  end
end
