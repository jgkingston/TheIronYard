class FoodsController < ApplicationController

  before_action :find_food, only: [:show, :edit, :update, :destroy]

  def show

  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.create food_params
    if @food.save == true
      redirect_to root_path
    else
      render :new 
    end 
  end

  def edit
  end

  def update
    if @food.update_attributes food_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def delete
    
  end

private

  def find_food
    @food = Food.find params[:id]
  end

  def food_params
    params.require(:food).permit(:name, :cost)
  end

end

