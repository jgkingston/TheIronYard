class WelcomeController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @facilities = Facility.all
     if params[:search]
      @facilities = Facility.search(params[:search]).order("created_at DESC")
    else
      @facilities = Facility.all.order('created_at DESC')
    end
  end

end
