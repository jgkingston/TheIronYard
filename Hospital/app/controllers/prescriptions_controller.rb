class PrescriptionsController < ApplicationController

  before_action :find_facility

  before_action :find_patient

  before_action :find_prescription

  # def new

  # end

  # def create
    
  # end

  def edit
  end

  def update
    if @prescription.update_attributes prescription_params
      redirect_to facility_patient_path(@facility, @patient)
    else
      render :edit
    end
  end

private

  def find_prescription
    @prescription = Prescription.find params[:id]
  end

  def find_patient
    @patient = Patient.find params[:patient_id]
  end

  def find_facility
    @facility = Facility.find params[:facility_id]
  end

  def prescription_params
    params.require(:prescription).permit(:patient_id, :medication_id, :instruction)

  end

end
