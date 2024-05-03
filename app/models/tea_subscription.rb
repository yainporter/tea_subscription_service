class TeaSubscription < ApplicationRecord
  belongs_to :tea
  belongs_to :subscription

  validates :tea_id, presence: true
  validates :subscription_id, presence: true
end
