lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |gem|
  gem.name          = "registry"
  gem.version       = IO.read('VERSION')
  gem.authors       = ["Michael Berkovich", "Scott Steadman"]
  gem.email         = ["registry-gem@stdmn.com"]
  gem.description   = %q{Framework for controlling application behavior through configurable properties}
  gem.summary       = gem.description
  gem.homepage      = "https://github.com/ss/registry"
  gem.license       = 'MIT'

  gem.add_development_dependency 'iconv'
  gem.add_development_dependency 'mocha'
  gem.add_development_dependency 'rails',     '~> 2.3.0'
  gem.add_development_dependency 'rake',      '0.9.2.2'
  gem.add_development_dependency 'shoulda',   '3.0.1'
  gem.add_development_dependency 'simplecov', '~>0.6.0'
  gem.add_development_dependency 'sqlite3',   '~>1.3.0'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
