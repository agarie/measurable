require 'rake'
require 'bundler/gem_tasks'
require "rspec/core/rake_task"
# require 'rdoc/task' # See below.

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

# RDoc task isn't working with custom generators, as can be seen in:
# https://github.com/rdoc/rdoc/issues/246
#
# Whenever this issue is fixed, I'll resume using this task.
#
# RDoc::Task.new do |rdoc|
#   rdoc.main = "README.md"
#   rdoc.rdoc_files.include("README.md", "LICENSE", "lib")
#   rdoc.generator = "fivefish"
#   rdoc.external = true
# end

# Compile task.
# Rake::ExtensionTask.new do |ext|
#     ext.name = 'measurable'
#     ext.ext_dir = 'ext/measurable'
#     ext.lib_dir = 'lib/'
#     ext.source_pattern = "**/*.{c, cpp, h}"
# end
