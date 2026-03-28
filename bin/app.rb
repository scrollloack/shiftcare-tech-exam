require_relative '../lib/cli/main_option_parser'
require_relative '../app/services/search_client_service'
require_relative '../app/services/find_similar_emails_service'

options = CLI::MainOptionParser.new(ARGV).parse!

input_file = ARGV.first
json_data = JSON.parse(File.read(input_file))

result = if options[:find_similar_emails]
  Services::FindSimilarEmailsService.new(json_data)
else
  Services::SearchClientService.new(json_data, options)
end

result.run
