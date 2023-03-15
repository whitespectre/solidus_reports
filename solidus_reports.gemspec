# frozen_string_literal: true

$:.push File.expand_path("lib", __dir__)
require "solidus_reports/version"

Gem::Specification.new do |s|
  s.name = "solidus_reports"
  s.version = SolidusReports::VERSION
  s.summary = "Reports module from Solidus core"
  s.description = s.summary
  s.license = "BSD-3-Clause"

  s.author = "Jonathan Tapia"
  s.email = "jonathan.tapia@magmalabs.io"
  s.homepage = "http://github.com/solidusio-contrib/solidus_reports"

  if s.respond_to?(:metadata)
    s.metadata["homepage_uri"] = s.homepage
    s.metadata["source_code_uri"] = s.homepage
  end

  s.required_ruby_version = [">= 2.5", "< 4.0"]

  s.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  s.test_files = Dir["spec/**/*"]
  s.bindir = "exe"
  s.executables = s.files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "solidus_core", [">= 2.5", "< 4.0"]
  s.add_dependency "solidus_support", "~> 0.5"

  s.add_development_dependency "rspec-activemodel-mocks"
  s.add_development_dependency "solidus_dev_support"
end
