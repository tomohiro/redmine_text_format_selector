# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'redmine_text_format_selector/version'

Gem::Specification.new do |spec|
  spec.name          = 'redmine_text_format_selector'
  spec.version       = RedmineTextFormatSelector::VERSION
  spec.authors       = ['Tomohiro TAIRA']
  spec.email         = ['tomohiro.t@gmail.com']

  spec.summary       = %q{Add Text format selector to project}
  spec.description   = %q{Add Text format selector to project}
  spec.homepage      = 'https://github.com/Tomohiro/redmine_text_format_selector'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.10'
  spec.add_development_dependency 'rake', '~> 10.0'
end
