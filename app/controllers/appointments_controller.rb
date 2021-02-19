class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
    render json: @appointments
  end

  def show
    @appointment = Appointment.find(params[:id])
    # @appointments = Appointment.new
  end

  def create
    @student = Student.find(appt_params[:student_id])
    @appointment = Appointment.create!(appt_params)
    redirect_to student_path(@student)
  end

  def update
    @appointment = Appointment.find(params[:id])
    @appointment.update!(appt_params)
    redirect_to appointment_path(@appointment)
  end

  def schedule
    @appointments = Appointment.all # .where('date == ? AND time > ?', Date.new, Time.now)
    @students = Student.all
    @student = Student.new
  end

  private

  def appt_params
    params.require(:appointment).permit(:date, :time, :user_id, :student_id, :notes)
  end
end
