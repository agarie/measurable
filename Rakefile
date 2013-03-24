require 'rake'
require 'bundler/gem_tasks'
require "rspec/core/rake_task"

# Setup the necessary gems, specified in the gemspec.
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end

# Run all the specs.
RSpec::Core::RakeTask.new(:spec)

# Compile task.
# Rake::ExtensionTask.new do |ext|
#     ext.name = 'measurable'          
#     ext.ext_dir = 'ext/measurable' 
#     ext.lib_dir = 'lib/'
#     ext.source_pattern = "**/*.{c, cpp, h}" 
# end
