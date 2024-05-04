class AddColumnStartDateToCustomerSubscription < ActiveRecord::Migration[7.1]
  def change
    add_column :customer_subscriptions, :start_date, :string, default: DateTime.now.strftime("%m/%d/%Y")
    add_column :customer_subscriptions, :cancellation_date, :string
  end
end
