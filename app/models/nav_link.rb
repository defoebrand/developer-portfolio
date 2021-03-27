class NavLink < ApplicationRecord
  validates :name, :url, :icon, :order, :direction, :show_signed_out, presence: true
end
