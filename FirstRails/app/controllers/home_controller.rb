class HomeController < ApplicationController
  def index
    @gameshelves = Gameshelf.all
  end
end

