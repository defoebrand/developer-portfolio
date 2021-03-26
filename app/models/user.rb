class User < ApplicationRecord
  validates :name, :email, :role, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments
  has_many :students, through: :appointments
end
