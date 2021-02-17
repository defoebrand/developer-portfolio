class AddScheduleToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :schedule, :time
  end
end
