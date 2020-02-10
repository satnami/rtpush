require_relative './base_adapter'

module RTPush
  class HttpAdapter < RTPush::BaseAdapter
    class << self
      def push(message)
        payload = {
          notification: {
            title: ENV['NOTIFICATION_TITLE'],
            body: message
          }
        }
        http_request(ENV['NOTIFICATION_URL'], 'post', payload)
      rescue StandardError => e
        raise Errors::AdapterError, e.message
      end

      def http_request(url, http_method, payload)
        uri = URI.parse url.strip
        http = Net::HTTP.new(uri.host, uri.port)
        if uri.scheme == 'https'
          http.use_ssl = true
          http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        end
        http.open_timeout = 5
        http.read_timeout = 30
        # http.set_debug_output($stdout)
        case http_method
        when 'get'
          request = Net::HTTP::Get.new(safe_url(uri.path, uri.query, payload))
        else
          request = Net::HTTP::Post.new(uri.request_uri)
          request['Content-Type'] = 'application/json'
          request.body = payload.to_json
        end
        http.request(request)
      rescue Errno::ECONNREFUSED, Errno::EHOSTUNREACH, Net::ReadTimeout, Net::OpenTimeout => e
        OpenStruct.new(code: 0, body: e.message)
      end
    end
  end
end
