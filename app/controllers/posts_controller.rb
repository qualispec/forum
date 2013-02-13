class PostsController < ApplicationController
  respond_to :json, :html

  def show
    @post = Post.find(params[:id])
    respond_with(@post)
  end

  def new
    redirect_to login_path unless current_user

    @post = Post.new
    @board = Board.find(params[:board_id])
  end

  def create
    @post = Post.new(params[:post])
    @post.user = current_user

    if @post.save
      redirect_to board_path(@post.board)
    else
      flash.now[:error] = @post.errors.full_messages.first
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @board = @post.board

    redirect_to login_path unless @post.user == current_user
  end

  def update
    @post = Post.find(params[:id])

    @post.update_attributes(params[:post])

    redirect_to post_path(@post)
  end
end
