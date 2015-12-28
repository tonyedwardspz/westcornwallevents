  class Admin::UsersController < Admin::AdminAreaController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = User.all
    @page_title = "View all Users"
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
    @page_title = "View User"
  end

  # GET /admin/users/new
  def new
    @admin_user = User.new
    @page_title = "New User"
  end

  # GET /admin/users/1/edit
  def edit
    @page_title = "Edit User"
  end

  # POST /admin/users
  # POST /admin/users.json
  def create
    @admin_user = User.new(admin_user_params)

    respond_to do |format|
      if @admin_user.save
        format.html { redirect_to admin_user_path(@admin_user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to admin_user_path(@admin_user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:user).permit(:name, :password, :password_confirmation, :twitter, :display_name)
    end
end
