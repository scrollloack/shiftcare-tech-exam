require 'json'

require_relative '../validations/find_similar_email_validations/resource_validator'

module Services
  class FindSimilarEmailsService
    def initialize(clients_data)
      @clients_data = clients_data
    end

    def run
      @errors = validate_resources

      return puts JSON.pretty_generate({ error: @errors }) unless @errors.empty?

      process
    end

    private

    def validate_resources
      FindSimilarEmailsValidations::ResourceValidator.new(
        clients
      ).run
    end

    def process
      output_results(clients)
    end

    def clients
      find_duplicates
    end

    def find_duplicates
      grouped = @clients_data.group_by { |client| client['email'] }

      grouped.select { |_email, clients| clients.size > 1 }
             .values
             .flatten
    end

    def output_results(results)
      puts JSON.pretty_generate({ 'data' => results })
    end
  end
end
