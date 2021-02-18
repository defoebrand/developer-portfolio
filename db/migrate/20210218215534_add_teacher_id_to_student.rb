class AddTeacherIdToStudent < ActiveRecord::Migration[6.0]
  def change
    add_column :students, :teacher_id, :integer
  end
end
