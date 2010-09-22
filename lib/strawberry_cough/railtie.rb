require 'routes_compiler'

module StrawberryCough
  class Railtie < Rails::Railtie
    config.to_prepare do |app|
      routes = app.routes.routes
      file = File.join(app.root, "public", "javascripts", "routes.js")
      File.open(file, "w") do |io|
        RoutesCompiler.compile_to_io(route_set, io)
      end
    end
  end
end
