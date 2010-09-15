module StrawberryCough
  class PathCompiler
    def self.compile(path)
      params  = PathParser.parse_params(path)
      anchors = PathParser.parse_anchors(path)
      anchors.map! { |a| %Q{"/#{a}/"} }

      params_without_format = params.reject { |p| p == "format" }

      url = anchors.zip(params_without_format).flatten.compact.join(" + ").gsub(/\/"$/, '"')
      js = <<-JS
        function(#{params.join(", ")}) {
          var url = #{url};
          return ( format !== undefined ) ? url + "." + format : url;
        };
      JS
    end
  end
end
