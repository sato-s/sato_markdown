require 'redcarpet'
require 'erb'
require 'pry'

class Markdown

  def initialize(markdown)
    @markdown = markdown
    @css = ""
    @js = ""
    load_plugin('vendor/prism')
    load_plugin('vendor/github-markdown')
  end

  # Table of contents
  def toc
    toc_renderer = Redcarpet::Render::HTML_TOC.new
    toc_markdown = Redcarpet::Markdown.new(toc_renderer)
    toc_markdown.render(@markdown)
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

  def css
    @css
  end

  def js
    @js
  end

  def to_html
    erb = ERB.new(File.read('template.html.erb'))
    erb.result(binding)
  end

  private

  # Load css and javascript in certain directory
  def load_plugin(dirname)
    css_list = Dir.glob(File.join(__dir__, dirname,'*.css'))
    css_list.each{|css| load_css(css)}
    js_list = Dir.glob(File.join(__dir__, dirname,'*.js'))
    js_list.each{|js| load_js(js)}
  end

  def load_css(filepath)
    css = File.read(filepath)
    @css += css
  end

  def load_js(filepath)
    js = File.read(filepath)
    @js += js
  end

end




raw = STDIN.read
md = Markdown.new raw
puts md.to_html
