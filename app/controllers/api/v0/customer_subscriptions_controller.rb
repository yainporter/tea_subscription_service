class Api::V0::CustomerSubscriptionsController < ApplicationController
  def index

  end

  def create
    customer_subscription = CustomerSubscription.create(customer_id: customer.id, subscription_id: subscription.id)
    render json: CustomerSubscriptionSerializer.new(customer_subscription, params: {active: true} ), status: :created
  end

  def update

  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id)
  end

  def customer
    Customer.find(customer_subscription_params[:customer_id])
  end

  def subscription
    Subscription.find(customer_subscription_params[:subscription_id])
  end
end
