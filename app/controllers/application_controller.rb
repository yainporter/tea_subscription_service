class ApplicationController < ActionController::API
rescue_from ActionController::ParameterMissing, with: :missing_parameters
rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def missing_parameters(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400)).serializer_validation, status: :bad_request
  end

  def record_not_found(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404))
    .serializer_validation, status: :not_found
  end
end
