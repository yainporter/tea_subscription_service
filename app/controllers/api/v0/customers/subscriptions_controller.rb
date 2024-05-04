class Api::V0::Customers::SubscriptionsController < ApplicationController
  def index
    subscriptions = Subscription.customer(customer)
    render json: SubscriptionSerializer.new(subscriptions), status: :ok
  end

  def customer
    Customer.find(params[:customer_id])
  end
end
