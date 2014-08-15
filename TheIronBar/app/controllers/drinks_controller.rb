class DrinksController < ApplicationController

  before_action :find_drink, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @drink = Drink.new
  end

  def create
    @drink = Drink.create drink_params
    redirect_to root_path  
  end

  def edit
  end

  def update
    @drink.update_attributes drink_params
    redirect_to root_path
  end

  def delete
    
  end

private

  def find_drink
    @drink = Drink.find params[:id]
  end

  def drink_params
    params.require(:drink).permit(:name, :cost)
  end

end
