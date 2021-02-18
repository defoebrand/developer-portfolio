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
end
