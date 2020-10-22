# frozen_string_literal: true

class Website < ApplicationRecord
  validates :title, :url, :mobile_description, :description, presence: true
  validates :title, length: {
    maximum: 25
  }
  validates :description, length: {
    maximum: 250
  }
  validates :mobile_description, length: {
    maximum: 100
  }
  has_and_belongs_to_many :stacks
  accepts_nested_attributes_for :stacks
end
