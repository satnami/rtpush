module RTPush
  class TwilioService
    class << self
      def push(message)
        client.messages.create(
          from: ENV['TWILIO_FROM_NUMBER'],
          to: ENV['TWILIO_TO_NUMBER'],
          body: message
        )
      rescue StandardError => _
        nil
      end

      private

      def client
        @client ||= Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
      end
    end
  end
end
