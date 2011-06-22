source 'http://rubygems.org/'

gemspec

gem 'rake', '~> 0.9.2'
gem 'rails', '~> 3.0.9'

gem 'rspec-rails', '~> 2.6.1', :group => [:development, :test]
gem 'therubyracer', '~> 0.9.1', :group => :test

platforms :mri_18 do
  group :quality do
    gem 'metric_fu', '~> 2.1.1'
    gem 'reek', '~> 1.2.8'
    gem 'flay', '~> 1.4.2'
    gem 'flog', '~> 2.5.1'
    gem 'yard', '~> 0.7.2'
    gem 'yardstick', '~> 0.4.0'
  end
end

