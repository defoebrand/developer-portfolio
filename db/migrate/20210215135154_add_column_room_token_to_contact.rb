class AddColumnRoomTokenToContact < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :room_token, :string
  end
end
