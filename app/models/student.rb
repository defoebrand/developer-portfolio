class Student < ApplicationRecord
  belongs_to :teacher, class_name: :user # , foreign_key: :teacher
  has_many :appointments
end
