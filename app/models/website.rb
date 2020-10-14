class Website < ApplicationRecord
  validates :title, :url, presence: true
  validates :description, presence: true, length: {
    maximum: 1000, too_long: '1000 characters in post is the maximum allowed.'
  }
  has_and_belongs_to_many :stacks
  accepts_nested_attributes_for :stacks
end
