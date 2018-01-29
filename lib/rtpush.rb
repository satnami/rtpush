Dir[File.join(__dir__, '/rtpush/*.rb')].each { |file| require file }
Dir[File.join(__dir__, '/rtpush/initializers/*.rb')].each { |file| require file }
Dir[File.join(__dir__, '/rtpush/adapters/*.rb')].each { |file| require file }

module RTPush
  def self.initialize(options, message)
    raise ArgumentError, 'Missing Message param' if message.to_s.empty?
    raise ArgumentError, 'Missing Arguments params' if options.empty?
    push(strategies(options), message)
  end

  private_class_method

  def self.push(strategies, message)
    strategies.each do |strategy|
      strategy.push(message)
    end
  end

  def self.strategies(options)
    strategies = []
    options.each do |option|
      case option
      when 'sms'
        strategies << RTPush::TwilioAdapter
      when 'mobile'
        strategies << RTPush::FcmAdapter
      when 'insta'
        strategies << RTPush::InstapushAdapter
      when 'slack'
        strategies << RTPush::SlackAdapter
      else
        raise Errors::NotImplementedStrategyError, "Unknown strategy #{option}"
      end
    end
    strategies
  end
end
