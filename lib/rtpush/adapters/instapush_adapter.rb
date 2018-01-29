module RTPush
  class InstapushAdapter < RTPush::BaseAdapter
    class << self
      def push(message)
        event = Instapush::Event.new ENV['INSTAPUSH_APP_EVENT']
        event.tracker = { message: message, version: '0.9.0' }
        client.push event
      rescue StandardError => e
        raise Errors::AdapterError, e.message
      end

      private

      def client
        @client ||= Instapush::Application.new ENV['INSTAPUSH_APP_ID'], ENV['INSTAPUSH_APP_SECRET']
      end
    end
  end
end
