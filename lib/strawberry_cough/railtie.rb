require 'strawberry_cough/routes_compiler'

module StrawberryCough
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
