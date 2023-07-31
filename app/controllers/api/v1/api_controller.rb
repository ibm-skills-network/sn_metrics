module Api
  module V1
    class ApiController < ActionController::Base # rubocop:disable Rails/ApplicationController
      respond_to :json
      skip_before_action :verify_authenticity_token

      rescue_from ActionController::ParameterMissing do |exc|
        error_unprocessable_entity(exc.message)
      end

      rescue_from ActiveRecord::RecordInvalid do |exc|
        error_unprocessable_entity(exc.message)
      end

      rescue_from ActiveRecord::RecordNotFound, with: :error_not_found

      protected

      def error_unprocessable_entity(message)
        render json: { error: message, status: 422 }, status: :unprocessable_entity
      end

      def error_unauthorized
        render json: { error: "unauthorized", status: 401 }, status: :unauthorized
      end

      def error_not_found
        render json: { error: "not found", status: 404 }, status: :not_found
      end

      private

      def current_resource_owner
        User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      def current_user
        current_resource_owner
      end

      def current_application
        doorkeeper_token.application
      end
    end
  end
end
