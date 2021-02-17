class AddTimeToStudents < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :date, :time_slot
  end
end
