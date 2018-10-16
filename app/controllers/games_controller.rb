class GamesController < ApplicationController
  # Add your GamesController code here
    def index
      @games = Game.all
      render json: @games
    end

    def create
      @game = Game.create(game_params)
      render json: @game, status: 2017
    end

    def show
      @game = Game.find(params[:id])
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @game }
      end

      def update
        @game.update(game_params)
        render json: @game, status: 204
    end

private

    def game_params
      params.require(:game).permit(:state)
    end
  end
