module RTPush
  class SlackAdapter < RTPush::BaseAdapter
    class << self
      def push(message)
        data = %(*#{ENV['NOTIFICATION_TITLE']}*\n`#{message}`)
        client.ping(data)
      rescue StandardError => e
        raise Error::AdapterError, e.message
      end

      private

      def client
        @client ||= Slack::Notifier.new(ENV['SLACK_WEBHOOK'])
      end
    end
  end
end
