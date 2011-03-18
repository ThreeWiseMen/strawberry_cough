source 'http://rubygems.org/'

gemspec

gem 'rake', '~> 0.8.7'

gem 'activesupport', '~> 3.0.5'
gem 'railties',      '~> 3.0.5'

group :test do
  gem 'rspec',        '~> 2.5.0'
  gem 'therubyracer', '~> 0.8.1'
end

platforms :mri_18 do
  group :quality do
    gem 'metric_fu', '~> 2.1.1'
  end
end

