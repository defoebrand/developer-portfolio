class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  def create
    p params
    @appointment = Appointment.create!(appt_params)
    redirect_to '/schedule'
  end

  private

  def appt_params
    params.require(:appointment).permit(:date, :time, :user_id, :student_id)
  end
end
