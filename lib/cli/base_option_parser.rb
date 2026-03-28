require 'optparse'

module CLI
  class BaseOptionParser < OptionParser
    def initialize(argv)
      super()
      @argv = argv
      @options = {}
      setup_options
    end

    def parse!
      super(@argv)
      @options
    end

    private

    def setup_options
      raise NotImplementedError
    end
  end
end
