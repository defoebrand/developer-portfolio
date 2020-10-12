class Website < ApplicationRecord
  validates :title, :url, presence: true
  validates :description, presence: true, length: { maximum: 1000, too_long: '1000 characters in post is the maximum allowed.' }
end
