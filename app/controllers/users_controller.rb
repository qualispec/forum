class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      #
    else
      flash.now[:error] = @user.errors.full_messages.first
      render "new"
    end
  end

end