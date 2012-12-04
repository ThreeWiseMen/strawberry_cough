# -*- encoding: utf-8 -*-
require File.expand_path("../lib/strawberry_cough/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "strawberry_cough"
  s.version     = StrawberryCough::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Craig Savolainen", "Nate Smith", "Shawn Lee-Kwong"]
  s.email       = ["support@threewisemen.ca"]
  s.homepage    = "http://github.com/ThreeWiseMen/strawberry_cough"
  s.summary     = "Strawberry Cough lets you access your Rails 3 routes in your JavaScripts."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "strawberry_cough"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
