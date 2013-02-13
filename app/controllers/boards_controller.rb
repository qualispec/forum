class BoardsController < ApplicationController
  respond_to :json, :html

  def index
    @boards = Board.all

    respond_with(@boards)
  end

  def show
    @board = Board.find(params[:id])

    respond_with(@board)
  end
end
