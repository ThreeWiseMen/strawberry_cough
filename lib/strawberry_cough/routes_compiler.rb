require 'active_support/inflector'
require 'active_support/core_ext'

module StrawberryCough

  # Compiles a set of routes to a JavaScript Routes object
  class RoutesCompiler

    # Compile route set to a JavaScript object
    #
    # @return [String]
    #
    # @api private
    def self.compile(route_set)
      functions = named_routes(route_set).inject(Set.new) do |memo, route|
        name = route.name.camelize(:lower) + "Path"
        memo << "#{name} : " + PathCompiler.compile(route.path.spec.to_s)
      end.to_a.join(',')

      <<-COMPILED
var Routes = {
    #{functions}
};
      COMPILED
    end

    # Write set to IO object
    #
    # @return [IO]
    #
    # @api private
    def self.compile_to_io(route_set, io)
      io << compile(route_set)
    end

    def self.named_routes(routes)
      routes.select {|x| x.name.present? }
    end
  end
end

