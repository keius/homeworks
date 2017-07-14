class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to new_session_url
    else
      flash[:errors] = @user.errors.full_messages
    end
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
