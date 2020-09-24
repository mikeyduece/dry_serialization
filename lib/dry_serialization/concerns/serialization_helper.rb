module DrySerialization
  module Concerns
    module SerializationHelper
      def success_response(data = {}, status = :ok)
        render json: data, status: status
      end

      def error_response(errors, status = :unprocessable_entity)
        errors = [errors] unless errors.is_a?(Array)
        errors = { errors: errors }

        render json: errors, status: status
      end

    end
  end
end
