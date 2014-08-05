class GamesController < ApplicationController

  def new
    @games = Game.new
  end

  def create
    Game.create game_params
    redirect_to root_path
  end

  def edit
    @game = Game.find params[:id]
  end

  def update
    @game = Game.find params[:id]
    @game.update_attributes game_params
    redirect_to root_path
  end

  def destroy
    @game = Game.find params[:id]
    @game.delete
    redirect_to root_path
  end

private
  def game_params 
    params.require(:game).permit(:title, :description, :minplayers, :maxplayers)
  end 

end
