class AddColumnRoomNameToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :room_name, :string
  end
end
