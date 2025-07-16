require_relative 'base_option_parser'
require_relative 'options/search_option'
require_relative 'options/find_similar_emails_option'

module CLI
  class MainOptionParser < BaseOptionParser
    def setup_options
      CLI::Options::SearchOption.register(self, @options)
      CLI::Options::FindSimilarEmailsOption.register(self, @options)
    end
  end
end
