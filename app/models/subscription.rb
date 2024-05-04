class Subscription < ApplicationRecord
  has_many :customer_subscriptions
  has_many :tea_subscriptions

  validates :title, presence: true, uniqueness: true
  validates :price, presence: true, numericality: true
  validates :frequency, presence: true

  enum frequency: ["One time purchase", "Weekly", "Bi-weekly"]

  def self.customers(customer_id)
    self.joins(:customer_subscriptions).where("customer_subscriptions.customer_id = ?", customer_id)
  end
end
