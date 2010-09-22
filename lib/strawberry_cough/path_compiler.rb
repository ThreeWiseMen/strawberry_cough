module StrawberryCough
  class PathCompiler

    def self.compile(path)
      params  = PathParser.parse_params(path)
      anchors = PathParser.parse_anchors(path)
      %Q{function(#{args_list(params)}) {var url = #{url_concatenation(anchors, params)};return addFormat(url, format);}}
    end

    private
      def self.url_concatenation(anchors, params)
        params_without_format = params.reject { |p| p == "format" }
        surrounded_anchors = anchors.map { |a| %Q{"#{a}"} }
        surrounded_anchors.zip(params_without_format).
                          flatten.
                          compact.
                          join(" + ")
      end

      def self.args_list(params)
        params.join(", ")
      end
  end
end
