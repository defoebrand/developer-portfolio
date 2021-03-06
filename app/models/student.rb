class Student < ApplicationRecord
  validates :name, :email, presence: true
  belongs_to :teacher, class_name: 'User', foreign_key: :teacher_id
  has_many :appointments
end
