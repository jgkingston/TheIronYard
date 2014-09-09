class FacilitiesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_facility, only: [:show, :edit, :update, :destroy]

  def index
    @facilities = Facility.all
     if params[:search]
      @medications = Facility.search(params[:search]).order("created_at DESC")
    else
      @medications = Facility.all.order('created_at DESC')
    end
  end

  def show
    # if params[:search]
    #   @patients = @facility.patients.search(params[:search]).order("created_at DESC")
    # else
    #   @patients = @facility.patients.all.order('created_at DESC')
    # end
    @patients = @facility.patients.where("lastname LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
      format.html
    end
  end

  def new
    @facility = Facility.new
  end

  def create
    @facility = Facility.create facility_params
    if @facility.save == true
      redirect_to facilities_path
      flash[:success] = "Facility successfully added."
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @facility.update_attributes facility_params
      redirect_to facilities_path
    else
      render :edit
    end
  end

  def search_patients
    @patients = Patient.where("lastname LIKE ?", "%#{params[:q]}%")
    respond_to do |format|
      format.js
      format.html
    end
  end

private

  def find_facility
    @facility = Facility.find params[:id]
  end

  # def find_ward
  #   @ward = Ward.find params[:ward_id]
  # end

  def facility_params
    params.require(:facility).permit(:name, :description, :bed)
  end

end
