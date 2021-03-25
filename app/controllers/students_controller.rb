class StudentsController < ApplicationController
  def index
    @appointments = Appointment.all
    @students = Student.all
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
    @appointment = Appointment.new
    @appointments = @student.appointments
    @teacher = current_user
  end

  def new
    @student = Student.new
    @teacher = current_user
  end

  def create
    @student = Student.create!(student_params)
    redirect_to student_path(@student)
  end

  def update
    @student = Student.find(student_params[:id])
    @student.update!(student_params)
    redirect_to student_path(@student)
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :teacher_id, :time_slot, :id)
  end
end
