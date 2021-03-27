class Appointment < ApplicationRecord
  validates :date, :time, presence: true
  belongs_to :student
  belongs_to :user
end
