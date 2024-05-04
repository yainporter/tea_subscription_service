class CustomerSubscriptionSerializer
  include JSONAPI::Serializer
  attribute :status

  attribute :start_date, if: Proc.new {|object, params|
    if params[:active]
      object.start_date
    end
  }

  attribute :cancellation_date, if: Proc.new {|object, params|
    unless params[:active]
      object.start_date
    end
  }
end
