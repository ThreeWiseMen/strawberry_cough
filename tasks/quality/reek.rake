begin
  require 'reek/rake/task'

  Reek::Rake::Task.new
rescue LoadError
  task :reek do
    abort "reek not available. Install with: gem install reek"
  end
end

