# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'vijay/version'

Gem::Specification.new do |gem|
  gem.name          = "vijay"
  gem.version       = Vijay::VERSION
  gem.authors       = ["Edwin Tunggawan"]
  gem.email         = ["vcc.edwint@gmail.com"]
  gem.description   = %q{Making sure your remote config is not tampered}
  gem.summary       = %q{Checking for altered configuration files in the remote host}
  gem.homepage      = "https://github.com/sdsdkkk/vijay"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib", "lib/vijay"]
end
