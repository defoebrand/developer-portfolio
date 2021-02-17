class AddDateToStudents < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :date_slot, :date
  end
end
