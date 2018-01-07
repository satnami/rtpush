Dir[File.join(__dir__, '/initializers/*.rb')].each { |file| require file }
Dir[File.join(__dir__, '/services/*.rb')].each { |file| require file }

module RTPush
  def self.initialize(options, message)
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
        strategies << RTPush::TwilioService
      when 'mobile'
        strategies << RTPush::FcmService
      when 'insta'
        strategies << RTPush::InstapushService
      when 'slack'
        strategies << RTPush::SlackService
      else
        #
      end
    end
    strategies
  end
end
