require_relative '../validations/find_similar_email_validations/resource_validator'

module Services
  class FindSimilarEmailsService
    def initialize(clients_data)
      @clients_data = clients_data
    end

    def run
      @errors = validate_resources

      return { error: @errors } unless @errors.empty?

      process
    end

    private

    def validate_resources
      return [ 'No client data loaded.' ] if @clients_data.empty?

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
      grouped = @clients_data
                .select { |client| client['email'].to_s.strip != '' }
                .group_by { |client| client['email'].to_s.strip.downcase }

      grouped.select { |_email, clients| clients.size > 1 }
    end

    def output_results(results)
      { 'data' => results }
    end
  end
end
