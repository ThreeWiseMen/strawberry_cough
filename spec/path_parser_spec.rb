require 'spec_helper'

describe StrawberryCough::PathParser do
  let(:parser) { StrawberryCough::PathParser }

  it "extracts parameters from simple resource path" do
    simple_resource_path = "/parent/:id/edit(.:format)"
    parser.parse_params(simple_resource_path).should == %w{id format}
  end

  it "extracts parameters from nested resource path" do
    nested_resource_path = "/parent/:parent_id/child/:id/edit(.:format)"
    parser.parse_params(nested_resource_path).should == %w{parent_id id format}
  end
end
