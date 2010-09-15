require 'active_support/inflector'

module StrawberryCough

  class RoutesCompiler
    def self.compile(route_set)
      functions = route_set.collect do |route|
        path_func_name = route.name.camelize(:lower) + "Path"
        "this.#{path_func_name} = " + PathCompiler.compile(route.path)
      end
      "var StrawberryCough = {#{functions.join}};"
    end
  end

end
