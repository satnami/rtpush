module RTPush
  class BaseAdapter
    attr_accessor :errors
    @@_validators = []

    def initialize
      @errors = []
    end

    def self.validates_presence_of(attribute)
      @@_validators << PresenceValidator.new(attribute)
    end

    def self.validates_existence_of(attribute)
      @@_validators << PresenceValidator.new(attribute)
    end

    def valid?
      @@_validators.each do |v|
        v.validate(self)
      end
      @errors.empty?
    end

    def exist?
      @@_validators.each do |v|
        v.exist(self)
      end
      @errors.empty?
    end
  end

  class PresenceValidator
    attr_reader :attributes

    def initialize(*attributes)
      @attributes = attributes
    end

    def validate(record)
      begin
        @attributes.each do |attribute|
          data = record.send(attribute)
          if data.nil? || data.empty?
            record.errors << ["#{attribute} can't be blank"]
          end
        end
      end
    end

    def exist(record)
      @attributes.each do |attribute|
        data = ENV[attribute.to_s]
        if data.nil? || data.empty?
          record.errors << ["#{attribute} can't be empty"]
        end
      end
    end
  end
end
