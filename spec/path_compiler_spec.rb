require 'spec_helper'

describe StrawberryCough::PathCompiler do
  let(:compiler) { StrawberryCough::PathCompiler }
  let(:simple_resource_path) { "/parent/:id/edit(.:format)" }

  it "compiles a simple resource path into a JavaScript function" do
    js = %Q{function(id, format) {var url = "/parent/" + id + "/edit";return ( format !== undefined ) ? url + "." + format : url;};}
    compiler.compile(simple_resource_path).should == js
  end
end
