require 'optparse'

module SatoMarkdown
  module CLI
    module_function

    def process(argv)
      option_parser = OptionParser.new do |opts|
      end

      file = argv.first
      raw = File.read(file)
      markdown = SatoMarkdown::Markdown.new raw
      puts markdown.to_html

    end
  end
end
