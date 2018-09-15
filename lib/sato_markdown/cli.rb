require 'optparse'

module SatoMarkdown
  module CLI
    module_function

    def process(argv)
      option_parser = OptionParser.new do |opts|
      end

      file = argv.first
      unless File.file? file
        STDERR.puts "No such file #{file}"
        exit 1
      end
      raw = File.read(file)
      markdown = SatoMarkdown::Markdown.new raw
      puts markdown.to_html

    end
  end
end
