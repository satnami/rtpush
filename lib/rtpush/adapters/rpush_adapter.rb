require_relative './base_adapter'

module RTPush
  class RpushAdapter < RTPush::BaseAdapter
    class << self
      def push(message)
        gcm_push(message)
        apn_push(message)
      rescue StandardError => e
        raise Errors::AdapterError, e.message
      end

      private

      def gcm_push(message)
        notification = Rpush::Gcm::Notification.new
        notification.app = gcm_client
        notification.priority = ENV['GCM_PRIORITY']
        notification.registration_ids = [ENV['GCM_ANDROID_DEVICE_TOKEN']]
        notification.notification = {
          title: ENV['TITLE_NOTIFICATION'],
          body: message,
          icon: ''
        }.reject { |_k, v| v.nil? || v.empty? }
        notification.data = { message: message }
        notification.save!
      end

      def apn_push(message); end

      def gcm_client
        @gcm_client = Rpush::Gcm::App.where(name: ENV['GCM_ANDROID_APP_NAME']).first
        unless @gcm_client
          @gcm_client = Rpush::Gcm::App.new
          @gcm_client.name = ENV['GCM_ANDROID_APP_NAME']
          @gcm_client.auth_key = ENV['GCM_AUTH_KEY']
          @gcm_client.connections = 1
          @gcm_client.save!
        end
        @gcm_client
      end

      def apn_client
        @apn_client = nil
      end
    end
  end
end
