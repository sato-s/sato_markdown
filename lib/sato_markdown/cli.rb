require 'optparse'
require 'find'

module SatoMarkdown
  module CLI
    module_function

    def process(argv)
      options = {
        font: 'tanukimagic',
        toc_nest: 3
      }

      option_parser = OptionParser.new do |opts|
        opts.banner = "Usage: sato_markdown FILENAME [options]"
        opts.on('-f', '--font [FONTNAME]', "Font name, available fonts: #{available_fonts}. Default #{options[:font]}.") do |v|
          options[:font] = v
        end
        opts.on('-o', '--output [OUTPUTFILE]', "Output file name. Default stdout") do |v|
          options[:output] = v
        end
        opts.on('-n', '--toc-nest [NESTING_LEVEL]', "nesting level of toc. Default #{options[:toc_nest]}") do |v|
          options[:toc_nest] = v.to_i
        end
      end

      remaining_argv = option_parser.parse!(argv)
      if remaining_argv.size != 1
        puts "Invalid argumrnt. Use -h option for help."
        exit 1
      end

      file = argv.first

      unless File.file? file
        STDERR.puts "No such file #{file}"
        exit 1
      end

      raw = File.read(file)
      markdown = SatoMarkdown::Markdown.new(raw, options)
      if options[:output].nil?
        puts markdown.to_html
      else
        output_file = File.join(Dir.pwd, options[:output])
        File.write(output_file, markdown.to_html)
      end

    end

    def available_fonts
      Find.find(Util.to_loadpath('vendor/fonts'))
        .select{|f| File.file? f}
        .map{|f| File.basename(f, '.ttf')}
    end

  end
end
