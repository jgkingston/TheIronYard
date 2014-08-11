class DoctorsController < ApplicationController

  before_action :find_doctor, only: [:show, :edit, :update, :destroy, :transition]

  before_action :find_facility

  def index
    @doctors = Doctor.all
  end

  def show
  end

  def new
    @doctor = Doctor.new
    @patients = Patient.all
  end

  def create
    @doctor = Doctor.create doctor_params
    #@doctor = @ward.doctors.new(doctor_params)
    if @doctor.save == true
      redirect_to facility_path(@facility)
    else
      render :new
    end
  end

  def edit
    @patients = Patient.all
  end

  def update
    if @doctor.update_attributes doctor_params
      redirect_to facility_doctor_path(@facility, @doctor)
    else
      render :edit
    end
    # @prescription = Prescription.create prescription_params
  end

  def destroy
    @doctor.destroy
    redirect_to doctors_path
  end
 
  def transition
    event = params[:event]+'!'
    @doctor.send(event.to_sym)
    redirect_to facility_doctor_path(@facility, @doctor)
  end

private

  def find_doctor
    @doctor = Doctor.find params[:id]
  end

  def find_facility
    @facility = Facility.find params[:facility_id]
  end

  def doctor_params
    params.require(:doctor).permit(:name, :specialty, :facility_id, {patient_ids: []})

  end






end
