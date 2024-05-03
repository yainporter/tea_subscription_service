class AddColumnStartDateToCustomerSubscription < ActiveRecord::Migration[7.1]
  def change
    add_column :customer_subscriptions, :start_date, :string
    add_column :customer_subscriptions, :cancellation_date, :string
  end
end
