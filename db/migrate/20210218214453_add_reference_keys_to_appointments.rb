class AddReferenceKeysToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :student_id, :integer
    add_index :appointments, :student_id

    add_column :appointments, :user_id, :integer
    add_index :appointments, :user_id

  end
end
