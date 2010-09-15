module StrawberryCough

  class PathCompiler
    class << self
      def compile(path)
        params  = PathParser.parse_params(path)
        anchors = PathParser.parse_anchors(path)
        js = <<-JS
          function(#{args_list(params)}) {
            var url = #{url_concatenation(anchors, params)};
            return ( format !== undefined ) ? url + "." + format : url;
          };
        JS
      end

      private
        def url_concatenation(anchors, params)
          params_without_format = params.reject { |p| p == "format" }
          surrounded_anchors = anchors.map { |a| %Q{"/#{a}/"} }
          pairs = surrounded_anchors.zip(params_without_format).flatten.compact
          url = pairs.join(" + ").gsub(/\/"$/, '"')
        end

        def args_list(params)
          params.join(", ")
        end
    end
  end

end
