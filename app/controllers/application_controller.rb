class ApplicationController < ActionController::API
rescue_from ActionController::ParameterMissing, with: :missing_params
rescue_from ActiveRecord::RecordNotFound, with: :no_records
rescue_from ActiveRecord::RecordInvalid, with: :validation_failed

  def no_records(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)).serializer_validation, status: :not_found
  end

  def missing_params(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400))
    .serializer_validation, status: :bad_request
  end
end
