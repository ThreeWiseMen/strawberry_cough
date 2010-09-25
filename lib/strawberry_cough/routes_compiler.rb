require 'active_support/inflector'

module StrawberryCough

  class RoutesCompiler

    def self.compile(route_set)
      functions = route_set.inject(Set.new) do |memo, route|
        name = route.name.camelize(:lower) + "Path"
        memo << "#{name} : " + PathCompiler.compile(route.path)
      end.to_a.join(',')
      <<-COMPILED
var StrawberryCough = {
    #{functions}
};
      COMPILED
    end

    def self.compile_to_io(route_set, io)
      io << compile(route_set)
    end

  end
end
