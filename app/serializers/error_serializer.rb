class ErrorSerializer
  include JSONAPI::Serializer

  def initialize(exception, status)
    @exception = exception
    @status = status
  end

  def serializable_hash
    {
      errors: [
        {
          status: @status,
          title: @exception.class.to_s,
          detail: @exception.message
        }
      ]
    }
  end

  def challenge_destroy_error
    {
      errors: [
        {
          status: @status,
          title: ActiveRecord::RecordNotFound,
          detail: @exception
        }
      ]
    }
  end
end