class ErrorSerializer
  include JSONAPI::Serializer

  def initialize(exception, status)
    @exception = exception
    @status = status
  end

  def serializable_hash
    {
      error: [
        {
          status: @status,
          title: @exception.class.to_s,
          detail: @exception.message
        }
      ]
    }
  end
end