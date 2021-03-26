require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  def setup
    @good_student = students(:good_student)
    @student_only_name = students(:student_only_name)
    @student_only_email = students(:student_only_email)
  end

  test 'new students with only name' do
    assert @student_only_name.invalid?
  end

  test 'new students with only email' do
    assert @student_only_email.invalid?
  end

  test 'new students with name and email' do
    assert @good_student.valid?
  end
end
