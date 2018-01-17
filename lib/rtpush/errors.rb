module Errors
  class Error < StandardError
    def initialize(msg = nil)
      @message = msg
    end

    def message
      @message
    end
  end

  class NotImplementedStrategyError < Error
    def message
      super
    end
  end

  class AdapterError < Error
    def message
      super
    end
  end

end
