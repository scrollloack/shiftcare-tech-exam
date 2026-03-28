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

      return { error: @errors } unless @errors.empty?

      process
    end

    private

    def validate_params
      return [ 'Missing query option.' ] if @options[:query].nil?
      return [ 'No client data loaded.' ] if @clients_data.empty?

      parse_query_and_normalize

      @errors = SearchClientsValidations::ParamValidation.new(
        @key,
        @search_value
      ).validate

      return @errors unless @errors.empty?

      validate_resources
    end

    def validate_resources
      unless @clients_data.first&.key?(@key)
        return [ 'Invalid search query key.' ]
      end

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
        'data' => @clients_data.select { |client| client[@key].to_s == @search_value.to_s }
      }
    end

    def output_results(results)
      results
    end
  end
end
