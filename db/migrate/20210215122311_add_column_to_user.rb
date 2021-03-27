class AddColumnToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :room_token, :string
  end
end
