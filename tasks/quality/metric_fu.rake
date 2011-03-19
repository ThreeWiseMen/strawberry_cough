begin
  require 'metric_fu'

  MetricFu::Configuration.run do |config|
    config.rcov = {
      :environment => 'test',
      :test_files => %w[ spec/**/*_spec.rb ],
      :rcov_opts => %w[
        --sort coverage
        --no-html
        --text-coverage
        --no-color
        --profile
        --include spec
        --exclude /gems/,/Library/,/usr/,spec
      ]
    }
  end
rescue LoadError
  namespace :metrics do
    task :all do
      abort "metric_fu is not available. Install with: gem install metric_fu"
    end
  end
end

