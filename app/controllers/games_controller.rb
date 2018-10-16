class GamesController < ApplicationController
  # Add your GamesController code here
  def index
    @games = Game.all
    render json: @games
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new
    @game.state = params[:state]
    @game.save

    render json: @game

  end

  def show
    @game = Game.find_by(params[:id])
    render json: @game
  end

  def update
    @game = Game.find_by(params[:id])
    @game.state = params[:state]
    @game.save
    render json: @game

  end

  private

  def game_params
    params.require(:game).permit(:state)
  end

end
