# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_products/version'

Gem::Specification.new do |spec|
  spec.name          = "aws_products"
  spec.version       = AwsProducts::VERSION
  spec.authors       = ["Chris Foster"]
  spec.email         = ["fosterchris22@gmail.com"]

  spec.summary       = %q{Simple Amazon Product Search.}
  spec.description   = %q{Use this gem to search through Amazon's products with ease. You can pass it keywords to search all products, or you can customize your search by passing options.}
  spec.homepage      = "https://github.com/chrisfoster22/aws_products"
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

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_runtime_dependency "httparty"
end
