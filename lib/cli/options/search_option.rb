module CLI
  module Options
    class SearchOption
      def self.register(parser, options)
        parser.on('--search QUERY', 'Search query in the form key=value') do |query|
          options[:query] = query
        end
      end
    end
  end
end
