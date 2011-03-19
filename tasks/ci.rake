desc 'Heckle and run metrics'
task :ci => [ :verify_measurements, :flog, :flay, :reek, 'metrics:all' ]

