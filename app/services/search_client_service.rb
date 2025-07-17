require 'json'

require_relative '../../lib/parse_query'
require_relative '../../lib/normalize_values'
require_relative '../validations/search_clients_validations/param_validator'
require_relative '../validations/search_clients_validations/resource_validator'

module Services
  class SearchClientService
    def initialize(clients_data, options)
      @clients_data = clients_data
      @options = options
    end

    def run
      @errors = validate_params

      return puts JSON.pretty_generate({ error: @errors }) unless @errors.empty?

      process
    end

    private

    def validate_params
      parse_query_and_normalize

      @errors = SearchClientsValidations::ParamValidation.new(
        @key,
        @search_value
      ).validate

      return @errors unless @errors.empty?

      validate_resources
    end

    def validate_resources
      SearchClientsValidations::ResourceValidator.new(
        client['data']
      ).run
    end

    def parse_query_and_normalize
      @key, raw_value = ParseQuery.new(@options[:query]).run
      @search_value = NormalizeValues.new(@key, raw_value).run
    end

    def process
      output_results(client)
    end

    def client
      {
        'data' => @clients_data.select { |client| client[@key] == @search_value }
      }
    end

    def output_results(results)
      puts JSON.pretty_generate(results)
    end
  end
end
