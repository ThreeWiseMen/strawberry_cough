require 'spec_helper'

describe StrawberryCough::PathParser do
  let(:parser) { StrawberryCough::PathParser }
  let(:simple_resource_path) { "/parent/:id/edit(.:format)" }
  let(:nested_resource_path) { "/parent/:parent_id/child/:id/edit(.:format)" }

  describe ".parse_params" do
    it "parses parameters from simple resource path" do
      parser.parse_params(simple_resource_path).should == %w{id format}
    end

    it "parses parameters from nested resource path" do
      parser.parse_params(nested_resource_path).should == %w{parent_id id format}
    end
  end

  describe ".parse_anchors" do
    it "parses anchors from a simple resource path" do
      parser.parse_anchors(simple_resource_path).should == %w{parent edit}
    end

    it "parses anchors from a nested resource path" do
      parser.parse_anchors(nested_resource_path).should == %w{parent child edit}
    end
  end
end
