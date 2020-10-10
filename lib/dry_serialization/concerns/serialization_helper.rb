module DrySerialization
  module Concerns
    module SerializationHelper
      def success_response(data = {}, status = :ok)
        render json: data, status: status
      end

      def error_response(errors, status = :unprocessable_entity)
        errors = [errors] unless errors.is_a?(Array)
        errors = handle_errors(errors)

        render json: { errors: errors }, status: status
      end
      
      private
      
      def handle_errors(*errors)
        errors.each_with_object({}) { |error, acc| acc << { detail: error } }
      end

    end
  end
end
