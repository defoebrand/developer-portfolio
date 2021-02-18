class StudentsController < ApplicationController
  def index
    @students = Student.all
    @student = Student.new
  end

  def show
    @student = Student.find(params[:id])
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.create(student_params)
    redirect_to '/schedule'
  end

  def update
    @student = Student. find(params[:id])
    @student.update(student_params)
    redirect_to schedule_path
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :time_slot)
  end
end
