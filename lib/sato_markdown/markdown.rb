require 'redcarpet'
require 'erb'
require 'base64'

module SatoMarkdown
  class Markdown

    def initialize(markdown, options)
      @markdown = markdown
      @css = ""
      @js = ""
      @options = options
      load_plugin('vendor/jquery')
      load_plugin('vendor/prism')
      load_plugin('vendor/github-markdown')
      load_css('css/toc.css')
      load_font("vendor/fonts/#{@options[:font]}.ttf")
    end

    # Table of contents
    def toc
      toc_renderer = Redcarpet::Render::HTML_TOC.new(nesting_level: @options[:toc_nest])
      toc_markdown = Redcarpet::Markdown.new(toc_renderer)
      <<-TOC
      <div id="toc">
        #{toc_markdown.render(@markdown)}
      </div>
      TOC
    end

    # HTML contents
    def content
      content_renderer = Redcarpet::Render::HTML.new(
        with_toc_data: true,
        hard_wrap: true,
      )
      content_markdown = Redcarpet::Markdown.new(content_renderer,
        fenced_code_blocks: true,
        autolink: true,
        tables: true,
        underline: true,
        highlight: true,
        quote: true,
        strikethrough: true)
      content_markdown.render(@markdown)
    end

    def font
      @font
    end

    def css
      @css
    end

    def js
      @js
    end

    def to_html
      erb = ERB.new(File.read(Util.to_loadpath('templates/template.html.erb')))
      erb.result(binding)
    end

    private

    # Load css and javascript in certain directory
    def load_plugin(relative_path)
      abs_path = Util.to_loadpath(relative_path)
      files = Dir.entries(abs_path).map{|f| File.join(relative_path, f)}
      files.grep(/.*\.css/).each{|css| load_css(css)}
      files.grep(/.*\.js/).each{|js| load_js(js)}
    end

    def load_css(relative_path)
      css = File.read(Util.to_loadpath(relative_path))
      @css += css
    end

    def load_js(relative_path)
      js = File.read(Util.to_loadpath(relative_path))
      @js += js
    end

    def load_font(relative_path)
      font = File.read(Util.to_loadpath(relative_path))
      @font = Base64.encode64(font).delete("\n")
    end

  end
end
