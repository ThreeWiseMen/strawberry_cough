require 'rake'

require 'rspec/core/rake_task'
require 'bundler'

Bundler::GemHelper.install_tasks

FileList['tasks/**/*.rake'].each { |task| import task }

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
