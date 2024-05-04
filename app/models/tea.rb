class Tea < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true, uniqueness: true
  validates :temperature, presence: true, numericality: true
  validates :brew_time, presence: true, numericality: true
end
