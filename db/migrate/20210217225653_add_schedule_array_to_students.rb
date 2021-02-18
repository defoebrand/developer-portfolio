class AddScheduleArrayToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :schedule, :string, array: true, default: []
  end
end
