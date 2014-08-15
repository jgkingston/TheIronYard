class MedicationsController < ApplicationController

  before_action :find_medication, only: [:show, :edit, :update, :destroy, :transition]

  def index
    @medications = Medication.all
    if params[:search]
      @medications = Medication.search(params[:search]).order("created_at DESC")
    else
      @medications = Medication.all.order('created_at DESC')
    end
  end

  def show
    
  end

  def new
    @medication = Medication.new
  end

  def create
    @medication = Medication.create medication_params
    #@medication = @ward.medications.new(medication_params)
    if @medication.save == true
      redirect_to medications_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @medication.update_attributes medication_params
      redirect_to medications_path
    else
      render :edit
    end
  end

  def destroy
    @medication.destroy
    redirect_to medications_path
  end
 
  def transition
    event = params[:event]+'!'
    @medication.send(event.to_sym)
    redirect_to medications_path
  end

private

  def find_medication
    @medication = Medication.find params[:id]
  end

  def medication_params
    params.require(:medication).permit(:name)
  end

end
