class RepliesController < ApplicationController

  def new
    @reply = Reply.new
    @post = Post.find(params[:post_id])
  end

  def create
    @reply = Reply.new(params[:reply])
    @reply.user = current_user

    if @reply.save
      redirect_to post_path(@reply.post)
    else
      flash.now[:error] = @reply.errors.full_messages.first
      render 'new'
    end
  end

  def edit
    @reply = Reply.find(params[:id])
    @post = @reply.post

    redirect_to login_path unless @reply.user == current_user
  end

  def update
    @reply = Reply.find(params[:id])

    @reply.update_attributes(params[:reply])

    redirect_to post_path(@reply.post)
  end

end