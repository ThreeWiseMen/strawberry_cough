require 'active_support/inflector'

module StrawberryCough
  class RoutesCompiler
    ADD_FORMAT_FUNCTION = 'function addFormat(url, format) {return ( format !== undefined ) ? url + "." + format : url;};'

    def self.compile(route_set)
      functions = route_set.inject(Set.new) do |memo, route|
        path_func_name = route.name.camelize(:lower) + "Path"
        memo << "this.#{path_func_name} = " + PathCompiler.compile(route.path)
      end
      "var StrawberryCough = {#{ADD_FORMAT_FUNCTION}#{functions.to_a.join}};"
    end

    def self.compile_to_io(route_set, io)
      io << compile(route_set)
    end
  end
end
