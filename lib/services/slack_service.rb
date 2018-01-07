module RTPush
  class SlackService
    class << self
      def push(message)
        data = %(*#{ENV['NOTIFICATION_TITLE']}*\n`#{message}`)
        client.ping(data)
      rescue StandardError => _
        nil
      end

      private

      def client
        @client ||= Slack::Notifier.new(ENV['SLACK_WEBHOOK'])
      end
    end
  end
end
