module CLI
  module Options
    class FindSimilarEmailsOption
      def self.register(parser, options)
        parser.on('--findSimilarEmails', 'Find similar emails in the data') do
          options[:find_similar_emails] = true
        end
      end
    end
  end
end
