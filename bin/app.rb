require_relative '../lib/cli/main_option_parser'
require_relative '../app/services/search_client_service'
require_relative '../app/services/find_similar_emails_service'

options = CLI::MainOptionParser.new(ARGV).parse!

input_file = ARGV.first

if input_file.nil?
  puts "Error: No input file provided.\nUsage: ruby your_script.rb path/to/input.json [--search key=value] [--findSimilarEmails]"
  exit(1)
end

unless File.exist?(input_file)
  puts "Error: No such file or directory - #{input_file}"
  exit(1)
end

begin
  json_data = JSON.parse(File.read(input_file))
rescue JSON::ParserError => e
  puts "Error: Failed to parse JSON from file - #{e.message}"
  exit(1)
end

result = if options[:find_similar_emails]
  Services::FindSimilarEmailsService.new(json_data)
else
  Services::SearchClientService.new(json_data, options)
end

puts JSON.pretty_generate(result.run)
