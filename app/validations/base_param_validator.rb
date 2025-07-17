module Validations
  class BaseParamValidator
    def initialize(key, value)
      @key = key
      @value = value
    end

    def validate
      raise NotImplementedError
    end
  end
end
