require 'json'

module Services
  class SearchClientService
    def initialize(clients_data, options)
      @clients_data = clients_data
      @options = options
    end

    def run
      process
    end

    private

    def process
      key, raw_value = parse_query(@options[:query])
      search_value = normalize_value(key, raw_value)
      results = find_matching_clients(key, search_value)
      output_results(results)
    end

    def parse_query(query)
      key, value = query.to_s.split('=', 2)
      [ key, value ]
    end

    def normalize_value(key, value)
      case key
      when 'id'
        value.to_i
      else
        value.to_s
      end
    end

    def find_matching_clients(key, value)
      {
        'data' => @clients_data.select { |client| client[key] == value }
      }
    end

    def output_results(results)
      puts JSON.pretty_generate(results)
    end
  end
end
