class AddColumnRoomNameToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :room_name, :string
  end
end
