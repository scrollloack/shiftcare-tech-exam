require_relative '../lib/cli/main_option_parser'
require_relative '../services/search_client_service'

options = CLI::MainOptionParser.new(ARGV).parse!

input_file = ARGV.first
json_data = JSON.parse(File.read(input_file))

result = if options[:find_similar_emails]
  raise NotImplementedError
else
  Services::SearchClientService.new(json_data, options)
end

result.run
