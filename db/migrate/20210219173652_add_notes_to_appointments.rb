class AddNotesToAppointments < ActiveRecord::Migration[6.0]
  def change
    add_column :appointments, :notes, :text
  end
end
