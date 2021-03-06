
#lib = File.expand_path("../lib", __FILE__)
#$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/knitting_patterns/version"

Gem::Specification.new do |spec|
  spec.name          = "knitting_patterns"
  spec.version       = KnittingPatterns::VERSION
  spec.authors       = ["Ashley Bland"]
  spec.email         = ["ashleyjbland@gmail.com"]
  spec.files         = ["lib/knitting_patterns.rb", "lib/knitting_patterns/cli.rb", "lib/knitting_patterns/scraper.rb", "lib/knitting_patterns/pattern.rb"]
  spec.summary       = "Free Knitting Patterns from Purl Soho"
  spec.description   = "Provides information on the free knitting patterns from Purl Soho"
  spec.homepage      = "https://github.com/ashleyjbland/knitting_patterns"
  spec.license       = "MIT"
  spec.executables << 'knitting_patterns'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
