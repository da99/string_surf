# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "string_surf"
  spec.version       = `cat VERSION`
  spec.authors       = ["da99"]
  spec.email         = ["i-hate-spam-1234567@mailinator.com"]
  spec.summary       = %q{Navigate a string: back or forward.}
  spec.description   = %q{
    An inefficient way to navigate a string by character, word,
    back/forward, and  search.
  }
  spec.homepage      = "https://github.com/da99/string_surf"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |file|
    file.index('bin/') == 0 && file != "bin/#{File.basename Dir.pwd}"
  }
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '>= 2.2.0'

  spec.add_development_dependency "pry"           , "~> 0.9"
  spec.add_development_dependency "bundler"       , "~> 1.5"
  spec.add_development_dependency "bacon"         , "~> 1.0"
  spec.add_development_dependency "Bacon_Colored" , "~> 0.1"
end
