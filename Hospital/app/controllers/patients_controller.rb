class PatientsController < ApplicationController

  before_action :find_patient, only: [:show, :edit, :update, :destroy, :transition]

  before_action :find_facility

  def index
    @patients = Patient.all
    respond_to do |format|
      format.js
      format.html
    end
  end

  def show
    @appointment = Appointment.new
  end

  def new
    @patient = Patient.new
    @medications = Medication.all
    @doctors = Doctor.all
  end

  def create
    @medications = Medication.all
    @patient = Patient.create patient_params
    #@patient = @ward.patients.new(patient_params)
    if @patient.save == true
      redirect_to facility_path(@facility)
      flash[:success] = "Patient successfully added."
    else
      render :new
    end
  end

  def edit
    @medications = Medication.all
    @doctors = Doctor.all
  end

  def update
    if @patient.update_attributes patient_params
      redirect_to facility_patient_path(@facility, @patient)
    else
      render :edit
    end
    # @prescription = Prescription.create prescription_params
  end

  def destroy
    @patient.destroy
    redirect_to facility_path(@facility)
  end
 
  def transition
    event = params[:event]+'!'
    @patient.send(event.to_sym)
    respond_to do |format|
      format.js
      format.html
    end
    # redirect_to facility_patient_path(@facility, @patient)
  end

private

  def find_patient
    @patient = Patient.find params[:id]
    # @prescriptions = Prescription.find params[:id]
  end

  def find_facility
    @facility = Facility.find params[:facility_id]
  end

  # def find_prescriptions
  #   @prescription = Prescription.find params[:]
  # end

  # def find_appointments

  # end

  def patient_params
    params.require(:patient).permit(:lastname, :firstname, :description, :dob, :gender, :facility_id, {medication_ids: []}, {doctor_ids: []})

  end
end



