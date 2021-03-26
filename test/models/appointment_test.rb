require 'test_helper'

class AppointmentTest < ActiveSupport::TestCase
  def setup
    @good_appt = appointments(:good_appt)
    @only_date = appointments(:only_date)
    @only_time = appointments(:only_time)
    @date_time = appointments(:date_time)
    @date_time_user = appointments(:date_time_user)
    @date_time_student = appointments(:date_time_student)
  end

  test 'new appointment with only date' do
    assert @only_date.invalid?
  end

  test 'new appointment with only time' do
    assert @only_time.invalid?
  end

  test 'new appointment with only date and time' do
    assert @date_time.invalid?
  end

  test 'new appointment with date, time, and user' do
    assert @date_time_user.invalid?
  end

  test 'new appointment with date, time, and student' do
    assert @date_time_student.invalid?
  end

  test 'new appointment with date, time, user, and student' do
    assert @good_appt.valid?
  end
end
