lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)

require 'measurable/version'

Gem::Specification.new do |gem|
  gem.name = "measurable"  
  gem.version = Measurable::VERSION
  gem.date = Date.today.to_s
  gem.summary = %Q{A Ruby module with a lot of distance measures for your projects.}
  gem.description = %Q{A Ruby module with a lot of distance measures for your projects.}
  
  gem.authors = ["Carlos Agarie"]
  gem.email = "carlos@onox.com.br"
  gem.homepage = "http://github.com/agarie/measurable"

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }

  gem.require_paths = ["lib"]  
  gem.extensions = ['ext/measurable/extconf.rb']

  gem.required_ruby_version = '>= 1.9.2'

  gem.add_development_dependency 'bundler'
  gem.add_development_dependency 'rake', '~> 0.9'
  gem.add_development_dependency 'rake-compiler', '~> 0.8.1'
  gem.add_development_dependency 'rspec', '~> 2.9.0'
end
