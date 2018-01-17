module RTPush
  class FcmAdapter < RTPush::BaseAdapter
    class << self
      def push(message)
        registration_ids = [ENV['GCM_ANDROID_DEVICE_TOKEN']]
        options = {
          notification: {
            title: ENV['NOTIFICATION_TITLE'],
            body: message,
            icon: '',
            click_action: ''
          }.reject { |_k, v| v.nil? || v.empty? },
          data: {
            message: message,
            picture: ''
          }.reject { |_k, v| v.nil? || v.empty? }
        }.reject { |_k, v| v.nil? || v.empty? }
        client.send(registration_ids, options)
      rescue StandardError => e
        raise Error::AdapterError, e.message
      end

      private

      def client
        @client ||= FCM.new(ENV['GCM_AUTH_KEY'])
      end
    end
  end
end
