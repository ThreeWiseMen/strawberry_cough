require 'spec_helper'

describe StrawberryCough::RoutesCompiler do
  let(:compiler) { StrawberryCough::RoutesCompiler }
  let(:interpreter) { V8::Context.new }

  it "makes an empty JavaScript object when given an empty route set" do
    routes_object = compiler.compile([])
    interpreter.eval(routes_object)
    interpreter.eval("Routes.rootPath === undefined").should be_true
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
