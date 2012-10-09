require 'rake'
require 'spec/rake/spectask'

Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies
task :default => :spec

# Euclidean Distance
Rake::ExtensionTask.new('euclidean_distance') do |ext|
  ext.lib_dir = File.join('lib', 'measurables')
end

# Core
Rake::ExtensionTask.new('core') do |ext|
  ext.lib_dir = File.join('lib', 'measurables')
end

Rake::Task[:spec].prerequisites << :compile