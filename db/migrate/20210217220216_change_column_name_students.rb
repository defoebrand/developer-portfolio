class ChangeColumnNameStudents < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :schedule, :date
  end
end
