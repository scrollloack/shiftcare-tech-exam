require_relative '../base_resource_validator'

module SearchClientsValidations
  class ResourceValidator < Validations::BaseResourceValidator
    def run
      errors = []

      errors << 'Client does not exists in the input dataset.' if @data.empty?

      errors
    end
  end
end
