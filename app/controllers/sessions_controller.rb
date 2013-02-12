class SessionsController < ApplicationController

  def new
    redirect_to boards_path if current_user

    @session = User.new
  end

  def create
    @user = User.find_by_username(params[:user][:username])

    if @user
      build_cookie(@user)
      redirect_to boards_path
    else
      flash.now[:error] = "Invalid Username/Password"
      @session = @user
      render "new"
    end
  end

  def destroy
    current_user.update_attributes(session_token: nil)
    cookies.delete(:session_token)
    cookies.delete(:user_id)

    redirect_to boards_path
  end


end