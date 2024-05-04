class CustomerSubscription < ApplicationRecord
  validates :customer_id, presence: true
  validates :subscription_id, presence: true
  validates :status, presence: true
  validates :start_date, presence: true

  enum status: ["Active", "Cancelled"]
end
