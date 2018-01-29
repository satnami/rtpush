module RTPush
  class TwilioAdapter < RTPush::BaseAdapter
    class << self
      def push(message)
        client.messages.create(
          from: ENV['TWILIO_FROM_NUMBER'],
          to: ENV['TWILIO_TO_NUMBER'],
          body: message
        )
      rescue StandardError => e
        raise Errors::AdapterError, e.message
      end

      private

      def client
        @client ||= Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      end
    end
  end
end
