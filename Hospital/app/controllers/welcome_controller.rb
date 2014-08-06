class WelcomeController < ApplicationController
  def index
    @patients = Patient.all
  end
end
