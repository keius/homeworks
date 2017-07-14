class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if user
      render :new
    else
      flash[:errors] = ["Invalid"]
    end
  end

  def destroy
    logout!
    render :new
  end
end
