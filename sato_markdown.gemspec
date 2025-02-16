# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sato_markdown/version'

Gem::Specification.new do |spec|
  spec.name          = "sato_markdown"
  spec.version       = SatoMarkdown::VERSION
  spec.authors       = ["sato-s"]
  spec.email         = ["s.sato.desu@gmail.com"]

  spec.summary       = %q{sato's markdown compiler}
  spec.description   = %q{Compile markdown into beautiful HTML which you can distribute easily}
  spec.homepage      = "https://github.com/sato-s/sato_markdown"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "redcarpet", "~> 3.6"
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
end
