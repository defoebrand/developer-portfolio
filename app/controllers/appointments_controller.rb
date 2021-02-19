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
    @student = Student.find(appt_params[:student_id])
    @appointment = Appointment.create!(appt_params)
    redirect_to student_path(@student)
  end

  def schedule
    @appointments = Appointment.all # .where('date == ? AND time > ?', Date.new, Time.now)
    @students = Student.all
    @student = Student.new
  end

  private

  def appt_params
    params.require(:appointment).permit(:date, :time, :user_id, :student_id)
  end
end
