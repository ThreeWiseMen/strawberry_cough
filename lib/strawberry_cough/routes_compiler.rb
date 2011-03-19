require 'active_support/inflector'

module StrawberryCough

  # Compiles a set of routes to a JavaScript Routes object
  class RoutesCompiler

    # Compile route set to a JavaScript object
    #
    # @returns [String]
    #
    # @api private
    def self.compile(route_set)
      functions = route_set.inject(Set.new) do |memo, route|
        name = route.name.camelize(:lower) + "Path"
        memo << "#{name} : " + PathCompiler.compile(route.path)
      end.to_a.join(',')
      <<-COMPILED
var Routes = {
    #{functions}
};
      COMPILED
    end

    # Write set to IO object
    #
    # @returns [IO]
    #
    # @api private
    def self.compile_to_io(route_set, io)
      io << compile(route_set)
    end

  end
end

