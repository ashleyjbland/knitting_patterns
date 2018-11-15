
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "knitting_patterns/version"

Gem::Specification.new do |spec|
  spec.name          = "knitting_patterns"
  spec.version       = KnittingPatterns::VERSION
  spec.authors       = ["'Ashley Bland'"]
  spec.email         = ["'ashleyjbland@gmail.com'"]

  spec.summary       = "Hot Right Now Knitting Patterns"
  spec.description   = "Provides information on Ravelry's popular knitting patterns"
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.executables << 'knitting_patterns'

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", ">= 0"
  spec.add_dependency "nokogiri", ">= 0"
  spec.add_development_dependency "pry", ">= 0"
end
