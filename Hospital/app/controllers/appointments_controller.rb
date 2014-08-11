class AppointmentsController < ApplicationController

before_action :find_appointment, only: [:show, :edit, :update, :destroy]

before_action :find_facility

before_action :find_patient

before_action :find_doctor


  def index
    @appointments = Appointment.all
  end

  def show
    
  end

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.create appointment_params
    if @appointment.save == true
      redirect_to appointment_params
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    if @appointment.update_attributes appointment_params
      redirect_to appointments_path
    else
      render :edit
    end
  end

private

  def find_facility
    @facility = Facility.find params[:facility_id]
  end

  def find_appointment
    @appointment = Appointment.find params[:id]
  end

  def find_patient
    @patient = Patient.find params[:patient_id]
  end

  def find_doctor
    @doctor = Doctor.find params[:doctor_id]
  end

  def appointment_params
    params.require(:appointment).permit(:patient_id, :doctor_id, :when)
  end

end
