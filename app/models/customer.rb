class Customer < ApplicationRecord
  has_many :customer_subscriptions
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :last_name, presence: true
end
