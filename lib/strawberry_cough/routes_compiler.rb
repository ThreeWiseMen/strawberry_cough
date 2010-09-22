require 'active_support/inflector'

module StrawberryCough
  class RoutesCompiler

    def self.compile(route_set)
      functions = route_set.inject([]) do |memo, route|
        path_func_name = route.name.camelize(:lower) + "Path"
        memo << "this.#{path_func_name} = " + PathCompiler.compile(route.path)
      end
      "var StrawberryCough = {#{functions.uniq.join}};"
    end

    def self.compile_to_io(route_set, io)
      io << compile(route_set)
    end
  end
end
