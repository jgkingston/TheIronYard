class GameshelvesController < ApplicationController
  
  def show
    @gameshelf = Gameshelf.find params[:id]
  end

  def new
    @gameshelves = Gameshelf.new
  end

  def create
    Gameshelf.create gameshelf_params
    redirect_to root_path
  end

  def edit
    @gameshelf = Gameshelf.find params[:id]
  end

  def update
    @gameshelf = Gameshelf.find params[:id]
    @gameshelf.update_attributes gameshelf_params
    redirect_to root_path
  end

  def destroy
    @gameshelf = Gameshelf.find params[:id]
    @gameshelf.delete
    redirect_to root_path
  end

private
  def gameshelf_params
    params.require(:gameshelf).permit(:title, :players, :playtime)
  end

end
