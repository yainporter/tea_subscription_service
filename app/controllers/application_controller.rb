class ApplicationController < ActionController::API
rescue_from ActionController::ParameterMissing, with: :missing_params_or_records
rescue_from ActiveRecord::RecordNotFound, with: :missing_params_or_records
rescue_from ActiveRecord::RecordInvalid, with: :validation_failed

  def missing_params_or_records(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 404)).serializer_validation, status: :not_found
  end

  def validation_failed(exception)
    render json: ErrorSerializer.new(ErrorMessage.new(exception.message, 400))
    .serializer_validation, status: :bad_request
  end
end
