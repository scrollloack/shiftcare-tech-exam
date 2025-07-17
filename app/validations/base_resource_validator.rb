module Validations
  class BaseResourceValidator
    def initialize(data)
      @data = data
    end

    def run
      raise NotImplementedError
    end
  end
end
