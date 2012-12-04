require 'strawberry_cough/routes_compiler'

require 'tilt'
require 'sprockets'

begin
 require 'sprockets/railtie'
rescue LoadError
 require 'sprockets/rails/railtie'
end

module StrawberryCough
  module Rails
    class Railtie < ::Rails::Engine
      config.before_initialize do
        if defined?(Sprockets::Engines)
          Sprockets::Engines
          Sprockets.register_engine '.strawberry_cough', RoutesJSTemplate
        end
      end
    end
  end
end