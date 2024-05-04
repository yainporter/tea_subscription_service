class Api::V0::CustomerSubscriptionsController < ApplicationController
  before_action :check_creation_parameters, only: :create

  def create
    customer_subscription = CustomerSubscription.create!(customer_id: customer.id, subscription_id: subscription.id)
    render json: CustomerSubscriptionSerializer.new(customer_subscription), status: :created
  end

  def update
    customer_subscription.update(cancellation_date: DateTime.now.strftime("%m/%d/%Y"), status: "Cancelled")
    render json: CustomerSubscriptionSerializer.new(customer_subscription, params: {inactive: true}), status: :no_content
  end

  private

  def customer_subscription_params
    params.require(:customer_subscription).permit(:customer_id, :subscription_id, :customer_subscription_id)
  end

  def customer
    Customer.find(customer_subscription_params[:customer_id])
  end

  def subscription
    Subscription.find(customer_subscription_params[:subscription_id])
  end

  def customer_subscription
    CustomerSubscription.find(customer_subscription_params[:customer_subscription_id])
  end

  def check_creation_parameters
    if customer_subscription_params[:customer_id].nil? || customer_subscription_params[:subscription_id].nil?
      render json: ErrorSerializer.new(ErrorMessage.new("Invalid parameters, try again.", 400)).serializer_validation, status: :bad_request
    end
  end
end
