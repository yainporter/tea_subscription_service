class CustomerSubscription < ApplicationRecord
  belongs_to :customer
  belongs_to :subscription

  validates :customer_id, presence: true
  validates :subscription_id, presence: true
  validates :status, presence: true
  validates :start_date, presence: true

  enum status: ["Active", "Cancelled"]
end
