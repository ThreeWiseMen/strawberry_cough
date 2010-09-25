require 'spec_helper'

describe StrawberryCough::PathCompiler do
  let(:compiler) { StrawberryCough::PathCompiler }
  let(:interpreter) { V8::Context.new }

  it "compiles a resource path into a JavaScript function that returns that path" do
    resource_path = "/parent/:id/edit(.:format)"
    path_function = compiler.compile(resource_path)
    interpreter.eval("var path = #{path_function};")
    interpreter.eval("path(1, 'xml')").should == '/parent/1/edit.xml'
  end

  it "compiles the root path to a JS function that returns the root path" do
    root_path = "/(.:format)"
    path_function = compiler.compile(root_path)
    interpreter.eval("var rootPath = #{path_function};")
    interpreter.eval("rootPath('xml')").should == '/.xml'
  end

  it "compiles a path without parameters to a JS function that returns that path" do
    simple_path = "/parent/new(.:format)"
    path_function = compiler.compile(simple_path)
    interpreter.eval("var simplePath = #{path_function};")
    interpreter.eval("simplePath('xml')").should == '/parent/new.xml'
  end

  it "compiles a path to a function that optionally takes a format" do
    path_with_format = "/parent/new(.:format)"
    path_function = compiler.compile(path_with_format)
    interpreter.eval("var path = #{path_function}")
    interpreter.eval("path()").should == "/parent/new"
  end
end
