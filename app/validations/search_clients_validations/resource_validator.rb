module SearchClientsValidations
  class ResourceValidator
    def initialize(data)
      @data = data
    end

    def run
      errors = []

      errors << 'Client does not exists in the input dataset.' if @data.empty?

      errors
    end
  end
end
