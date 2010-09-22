# -*- encoding: utf-8 -*-
require File.expand_path("../lib/strawberry_cough/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "strawberry_cough"
  s.version     = StrawberryCough::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = []
  s.email       = []
  s.homepage    = "http://rubygems.org/gems/strawberry_cough"
  s.summary     = ""
  s.description = ""

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "strawberry_cough"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
end
