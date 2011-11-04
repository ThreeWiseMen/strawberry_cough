require 'tilt/template'
require 'strawberry_cough/routes_compiler'

module StrawberryCough
  class RoutesJSTemplate < Tilt::Template

    def prepare
    end

    def render(scope=Object.new, locals={}, &block)
      route_set = ::Rails.application.routes
      RoutesCompiler.compile(route_set.routes)
    end
  end
end
