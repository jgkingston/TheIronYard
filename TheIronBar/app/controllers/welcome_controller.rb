class WelcomeController < ApplicationController
  def index
    @foods = Food.all
    @drinks = Drink.all
  end
end
