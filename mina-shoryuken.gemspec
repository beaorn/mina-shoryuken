
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mina/shoryuken/version"

Gem::Specification.new do |spec|
  spec.name          = "mina-shoryuken"
  spec.version       = Mina::Shoryuken::VERSION
  spec.authors       = ["Bryce Johnston"]
  spec.email         = ["bryce@agdeveloper.com"]

  spec.summary       = %q{Shoryuken tasks for Mina deployments}
  spec.description   = %q{Shoryuken tasks for Mina deployments}
  spec.homepage      = "https://github.com/beaorn/mina-shoryuken"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
