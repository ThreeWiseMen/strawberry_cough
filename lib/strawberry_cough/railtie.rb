require 'strawberry_cough/routes_compiler'
require 'rails/railtie'

module StrawberryCough

  # Railtie compiles routes on first request in production environment,
  # and on every request in development environment
  class Railtie < Rails::Railtie
    config.to_prepare do
      app = Rails.application
      routes = app.routes.routes
      file = File.join(app.root, "public", "javascripts", "routes.js")
      File.open(file, "w") do |io|
        RoutesCompiler.compile_to_io(routes, io)
      end
    end
  end
end

