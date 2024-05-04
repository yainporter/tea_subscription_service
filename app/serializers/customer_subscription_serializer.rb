class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attribute :status, :start_date

  attribute :cancellation_date, if: Proc.new {|object, params|
    params[:inactive]
  }
end
