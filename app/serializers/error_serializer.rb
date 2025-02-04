class ErrorSerializer
  include JSONAPI::Serializer

  def initialize(error_object)
    @error_object = error_object
  end

  def serializer_validation
    {
      errors: [
          {
            status: @error_object.status,
            detail: @error_object.message
          }
        ]
      }
  end
end
