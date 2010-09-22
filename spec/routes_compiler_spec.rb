require 'spec_helper'

describe StrawberryCough::RoutesCompiler do
  let(:compiler) { StrawberryCough::RoutesCompiler }

  it "makes an empty JavaScript object when given an empty route set" do
    compiler.compile([]).should == "var StrawberryCough = {};"
  end

  it "makes a Routes JavaScript object when given a set of routes" do
    route = double('route')
    route.stub(:path) { "/parent/:id/edit(.:format)" }
    route.stub(:name) { "edit_parent" }
    compiler.compile([route]).should == %Q{var StrawberryCough = {this.editParentPath = function(id, format) {var url = "/parent/" + id + "/edit";return ( format !== undefined ) ? url + "." + format : url;};};}
  end

  it "filters duplicate routes" do
    route = double('route')
    route.stub(:path) { "/parent/:id/edit(.:format)" }
    route.stub(:name) { "edit_parent" }
    compiler.compile([route, route]).should == %Q{var StrawberryCough = {this.editParentPath = function(id, format) {var url = "/parent/" + id + "/edit";return ( format !== undefined ) ? url + "." + format : url;};};}
  end
end
