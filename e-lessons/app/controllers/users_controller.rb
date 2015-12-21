class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user_by_tamir
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update_attributes(secure_params)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end

  def destroy
    user = User.find(params[:id])

    user.destroy
    redirect_to users_path, :notice => "User deleted."
  end

  private

  def secure_params
    params.require(:user).permit(:role)
  end

  def authorize_user_by_tamir
    if user_signed_in? && !current_user.admin?
      redirect_to new_user_session_path
    end
  end
end
