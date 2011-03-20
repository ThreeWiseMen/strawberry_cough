require 'spec_helper'

describe StrawberryCough::RoutesCompiler do
  let(:compiler) { StrawberryCough::RoutesCompiler }
  let(:interpreter) { V8::Context.new }

  it "generates an empty Routes object with an empty route set" do
    empty_routes_object = compiler.compile([])
    interpreter.eval(empty_routes_object)
    property_check = "for (var prop in Routes) { return prop; }"
    interpreter.eval(property_check).should be_nil
  end

  it "makes a Routes JavaScript object when given an array of routes" do
    route = double('route')
    route.stub(:path) { "/parent/:id/edit(.:format)" }
    route.stub(:name) { "edit_parent" }
    routes_object = compiler.compile([route])
    interpreter.eval(routes_object)
    interpreter.eval("typeof Routes.editParentPath === 'function'").should be_true
  end
end

