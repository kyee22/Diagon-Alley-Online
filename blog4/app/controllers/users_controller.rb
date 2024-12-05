class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  skip_before_action :authenticate, only: [ :login, :do_login, :new, :create ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to login_users_path, notice: "User was successfully registered." }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
  end

  def do_login
    user = User.where(username: params[:username], password: params[:password]).first
    if user
      session[:current_userid] = user.id
      redirect_to blogs_url, notice: 'User login successfully.'
    else
      redirect_to login_users_url, notice: 'Wrong username or password!'
    end
  end

  def logout
    session.delete(:current_userid)
    redirect_to login_users_url,  notice: 'User logout successfully!'
  end


  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_path, status: :see_other, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  ### Begin actions about following
  def follow
    user_to_follow = User.find(params[:id]) # 获取被关注用户
    if current_user.followings.include?(user_to_follow)
      flash[:notice] = "You are already following this user."
    else
      current_user.followings << user_to_follow
      flash[:success] = "You are now following #{user_to_follow.username}."
    end
    redirect_to user_path(user_to_follow)
  end

  def unfollow
    user_to_unfollow = User.find(params[:id]) # 获取取消关注的用户
    if current_user.followings.include?(user_to_unfollow)
      current_user.followings.delete(user_to_unfollow)
      flash[:success] = "You have unfollowed #{user_to_unfollow.username}."
    else
      flash[:notice] = "You are not following this user."
    end
    redirect_to user_path(user_to_unfollow)
  end

  def followings
    @user = User.find(params[:id])
    @followings = @user.followings
  end

  def followers
    @user = User.find(params[:id])
    @followers = @user.followers
  end
  ### End actions about following




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:username, :password, :email)
    end
end
