require_relative '../base_resource_validator'

module FindSimilarEmailsValidations
  class ResourceValidator < Validations::BaseResourceValidator
    def run
      errors = []

      errors << 'No clients has duplicate emails in the input dataset.' if @data.empty?

      errors
    end
  end
end
