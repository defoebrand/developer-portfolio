class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  def create
    # new_date = Date.parse(appt_params['date'])
    # new_time = Time.parse(appt_params['time'], new_date)
    # p new_time
    # appt_params['time'] = Time.parse(appt_params['time'], Date.parse(appt_params['date']))
    # new_params = appt_params.except(:time)
    # new_params['time'] = new_time
    # p new_params
    # @appointment = Appointment.create!(new_params)
    @appointment = Appointment.create!(appt_params)
    redirect_to '/schedule'
  end

  private

  def appt_params
    params.require(:appointment).permit(:date, :time, :user_id, :student_id)
  end
end
