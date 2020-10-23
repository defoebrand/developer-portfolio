# frozen_string_literal: true

class AddDescriptionToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :websites, :mobile_description, :string
    add_column :apps, :mobile_description, :string
    add_column :games, :mobile_description, :string
  end
end
