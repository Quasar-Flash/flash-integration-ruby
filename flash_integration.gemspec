# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)
require "flash/integration/version"

Gem::Specification.new do |s|
  s.name        = "flash_integration"
  s.version     = Flash::Integration::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Danilo Carolino"]
  s.email       = ["danilo.carolino@qflash.com.br"]
  s.homepage    = "https://github.com/Quasar-Flash/flash_integration"
  s.summary     = "Flash Integration Library"
  s.description = "A library to make easily to build integrations"
  s.required_ruby_version = ">= 2.7"
  s.files = Dir["{lib}/**/*"] + ["LICENSE", "Rakefile", "README.md", "CHANGELOG.md"]
  s.test_files = Dir["spec/**/*"]
  s.license = "MIT"

  s.metadata["changelog_uri"] = "https://github.com/Quasar-Flash/flash_integration/blob/master/CHANGELOG.md"
  s.metadata["source_code_uri"] = "https://github.com/Quasar-Flash/flash_integration"
  s.metadata["bug_tracker_uri"] = "https://github.com/Quasar-Flash/flash_integration/issues"

  s.add_dependency             "faraday", ">= 1.4.1", "< 2.8.0"
  s.add_dependency             "faraday-multipart", "~> 1.0.4", "> 1.0.0"

  s.add_development_dependency "bundler", ">= 1.2"
  s.add_development_dependency "pry", "~> 0.14.1"
  s.add_development_dependency "rake", "~> 13.0", ">= 10.0"
  s.add_development_dependency "rspec", "~> 3.12.0"
  s.add_development_dependency "rubocop", "~> 1.57.1"
  s.add_development_dependency "rubocop-packaging", "~> 0.5.1"
  s.add_development_dependency "rubocop-performance", "~> 1.20.1"
  s.add_development_dependency "rubocop-rspec", "~> 2.25.0"
  s.add_development_dependency "simplecov", "~> 0.21"
end
