require_relative '../../../lib/parse_query'
require_relative '../../../lib/normalize_values'

module SearchClientsValidations
  class ParamValidation
    def initialize(key, value)
      @key = key
      @value = value
    end

    def validate
      errors = []

      case @key
      when 'id'
        if @value.nil? || !@value.positive?
          errors << 'Param id must be present or is a positive integer.'
        end
      when 'email'
        unless valid_email?(@value)
          errors << 'Param email must be a valid email address.'
        end
      end

      errors
    end

    private

    def valid_email?(email)
      email.to_s.match?(/\A[^@\s]+@[^@\s]+\.[^@\s]+\z/)
    end
  end
end
