class Game < ApplicationRecord
  has_and_belongs_to_many :stacks
  accepts_nested_attributes_for :stacks
end
