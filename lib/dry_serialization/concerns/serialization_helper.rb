module DrySerialization
  module Concerns
    module SerializationHelper
      def success_response(data = {}, status = :ok)
        default_response = default_response(data, status)
        render json: default_response
      end
      
      def error_response(errors, status = :unprocessable_entity)
        errors = [errors] unless errors.is_a?(Array)
        errors = { errors: errors }
        default_response = default_response(errors, status)
        
        render json: default_response
      end
      
      def default_response(data, status)
        { status: status }.merge(data)
      end
    end
  end
end