require 'rake'
require "rake/extensiontask"

# Setup the necessary gems, specified in the gemspec.
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

# Compile task.
Rake::ExtensionTask.new do |ext|
    ext.name = 'measurable'          
    ext.ext_dir = 'ext/measurable' 
    ext.lib_dir = 'lib/'
    ext.source_pattern = "**/*.{c, cpp, h}" 
end
