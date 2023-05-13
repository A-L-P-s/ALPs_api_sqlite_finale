class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  # rescue_from PG::UndefinedColumn, with: :statement_invalid

  def record_not_found
    render json: ErrorSerializer.new(exception.message).serializable_hash, status: :not_found # 404
    # render json: ErrorSerializer.new($!, :not_found).serializable_hash, status: :not_found # 404
  end

  def record_invalid
    render json: ErrorSerializer.new(exception.message).serializable_hash, status: :unprocessable_entity #422
  end

  # def statement_invalid
  #   # render json: ErrorSerializer.new(exception.message).statement_invalid_hash, status: :unprocessable_entity #422
  #   error_serializer = ErrorSerializer.new($!, :unprocessable_entity)
  #   render json: error_serializer.statement_invalid_hash, status: :unprocessable_entity #422
  # end

  def imalittleteapot
    render json: ErrorSerializer.new(exception.message).serializable_hash, status: :teapot #418
  end
end