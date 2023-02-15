class UsersController < ApplicationController
  before_action :logged_in_user, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]
  before_action :show_access, only: :show

  def show
    @user = User.find(params[:id])
    @tasks = params[:tag_id].present? ? Tag.find(params[:tag_id]).tasks.where(is_done: true).paginate(page: params[:page]) : @user.tasks.where(is_done: true).paginate(page: params[:page])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params) 
    if @user.save
      reset_session
      log_in @user
      flash[:success] = "Welcome to ToDo App!!"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit', status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to root_url, status: :see_other
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    #before_action

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url, status: :see_other) unless current_user.admin?
    end

    def show_access
      @user = User.find(params[:id])
      redirect_to(root_url, status: :see_other) unless current_user?(@user) || current_user.admin?
    end

end
