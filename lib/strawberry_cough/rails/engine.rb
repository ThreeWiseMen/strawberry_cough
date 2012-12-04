require 'strawberry_cough/routes_compiler'
require 'rails/engine'

module StrawberryCough
  module Rails
    class Engine < ::Rails::Engine
      config.before_initialize do
        if defined?(Sprockets::Engines)
          Sprockets::Engines
          Sprockets.register_engine '.strawberry_cough', RoutesJSTemplate
        end
      end
    end
  end
end