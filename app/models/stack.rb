class Stack < ApplicationRecord
  validates :name, :color, presence: true
  has_and_belongs_to_many :websites
  has_and_belongs_to_many :apps
  has_and_belongs_to_many :games
end
