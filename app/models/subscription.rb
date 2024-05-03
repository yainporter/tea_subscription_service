class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :tea_subscriptions

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :frequency, presence: true

  enum frequency: ["One time purchase", "Weekly", "Bi-weekly"]
end
