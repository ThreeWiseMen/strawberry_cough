source 'http://rubygems.org/'

gemspec

gem 'rake'

gem 'activesupport'
gem 'railties'
gem 'tilt'
gem 'sprockets'

group :test do
  gem 'rspec'
  gem 'therubyracer'
end

platforms :mri_18 do
  group :quality do
    gem 'metric_fu', '~> 2.1.1'
    gem 'reek', '~> 1.2.8'
    gem 'flay', '~> 1.4.2'
    gem 'flog', '~> 2.5.1'
    gem 'yard', '~> 0.6.5'
    gem 'yardstick', '~> 0.3.0'
  end
end

