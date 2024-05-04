class TeaSubscription < ApplicationRecord
  validates :tea_id, presence: true
  validates :subscription_id, presence: true
end
