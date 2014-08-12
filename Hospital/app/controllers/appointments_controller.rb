class AppointmentsController < ApplicationController
  before_action :find_appointment, only: [:show, :edit, :update, :destroy]
  before_filter :find_scheduler
 


  def new
    
  end

  def create
   @appointment = @scheduler.appointments.create appointment_params
   redirect_to eval("facility_#{@scheduler.class.to_s.downcase}_path(@scheduler.facility_id, @scheduler)")

  end

  def destroy
    @appointment.destroy
    redirect_to eval("facility_#{@scheduler.class.to_s.downcase}_path(@scheduler.facility_id, @scheduler)")
  end


private

  def find_scheduler
    @klass = params[:scheduler_type].capitalize.constantize
    @scheduler = @klass.find params[:scheduler_id]
  end

  def find_appointment
    @appointment = Appointment.find params[:id]
  end

  def appointment_params
    params.require(:appointment).permit(:doctor_id, :patient_id, :when)
  end
end
