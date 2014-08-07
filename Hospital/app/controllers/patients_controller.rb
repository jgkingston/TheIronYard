class PatientsController < ApplicationController

  before_action :find_patient, only: [:show, :edit, :update, :destroy, :transition]

  def index
    @patients = Patient.all
  end

  def show
    
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = Patient.create patient_params
    if @patient.save == true
      redirect_to patients_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @patient.update_attributes patient_params
      redirect_to patients_path
    else
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path
  end
 
  def transition
    event = params[:event]+'!'
    @patient.send(event.to_sym)
    redirect_to patients_path
  end

=begin
  waiting => checkup, xray, surgery, discharge
  checkup => xray, surgery, paybill
  xray => checkup, surgery, paybill
  surgery => checkup, xray, paybill
  paybill => leaving
  discharge

=end

private

  def find_patient
    @patient = Patient.find params[:id]
  end

  def patient_params
    params.require(:patient).permit(:lastname, :firstname, :description, :dob, :gender)
  end
end



