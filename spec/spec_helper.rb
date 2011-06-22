# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'

lib_dir = File.join(File.dirname(__FILE__), '..', 'lib')
$LOAD_PATH.unshift lib_dir unless $LOAD_PATH.include?(lib_dir)

require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec/rails'
require 'v8'

require 'strawberry_cough'

include StrawberryCough

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/{support,shared}/**/*.rb")].each { |f| require f }

