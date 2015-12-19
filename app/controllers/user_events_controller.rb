class UserEventsController < ApplicationController
  layout 'layouts/user_events_layout'
  skip_before_action :authorize, only: [:show, :new, :create]
  before_action :set_user_event, only: [:show, :edit, :update, :destroy]

  # GET /user_events
  # GET /user_events.json
  def index
    @user_events = UserEvent.all
  end

  # GET /user_events/1
  # GET /user_events/1.json
  def show
    @page_title = "Event Submitted: #{@user_event.title}"
  end

  # GET /user_events/new
  def new
    @user_event = UserEvent.new
    @page_title = "Submit a new event | West Cornwall Events"
  end

  # GET /user_events/1/edit
  def edit
    @page_title = "Edit event | West Cornwall Events"
  end

  # POST /user_events
  # POST /user_events.json
  def create
    @user_event = UserEvent.new(user_event_params)
    if @user_event.save && verify_recaptcha(model: @user_event)
      begin
        EventAdminNotifier.send_submission_admin_email(@user_event).deliver_now
        SubmissionThankYou.submission_thankyou_email(@user_event).deliver_now
      rescue => e
        logger.warn "Failed to send emails (user_event): #{e}"
      end
      if @user_event.add_to_mailling_list
        SubscribeJob.new.perform(@user_event)
      end
      respond_to do |format|
        format.html { redirect_to @user_event, notice: 'User event was successfully created.' }
        format.json { render :show, status: :created, location: @user_event }
      end
    else
      @user_event.valid?
      respond_to do |format|
        format.html { render :new }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_events/1
  # PATCH/PUT /user_events/1.json
  def update
    respond_to do |format|
      if @user_event.update(user_event_params)
        format.html { redirect_to @user_event, notice: 'User event was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_event }
      else
        format.html { render :edit }
        format.json { render json: @user_event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_events/1
  # DELETE /user_events/1.json
  def destroy
    @user_event.destroy
    respond_to do |format|
      format.html { redirect_to user_events_url, notice: 'User event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_event
      @user_event = UserEvent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_event_params
      params.require(:user_event).permit(:title, :date, :end_date, :location, :link, :image, :time, :time_end, :description, :first_name, :last_name, :user_email, :add_to_mailling_list, :venue_id, :image_cache)
    end
end
