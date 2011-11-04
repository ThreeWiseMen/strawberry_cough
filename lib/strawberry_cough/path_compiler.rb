module StrawberryCough

  # Compiles a path to a JavaScript function
  class PathCompiler

    # Compile path to JavaScript function
    #
    # @return [String]
    #
    # @api private
    def self.compile(path)
      params  = PathParser.parse_params(path)
      anchors = PathParser.parse_anchors(path)
      js = <<-COMPILED
function (#{args_list(params)}) {
    var url = #{url_concatenation(anchors, params)};
    if (format === undefined) {
      return url;
    } else {
      return url + "." + format;
    }
}
      COMPILED
      js.strip
    end

    private

    # Generate JavaScript to concatenate anchors and params into valid URL
    #
    # @return [String]
    #
    # @api private
    def self.url_concatenation(anchors, params)
      params_without_format = params.reject { |param| param == "format" }
      quoted_anchors = anchors.map { |anchor| "\"#{anchor}\"" }
      quoted_anchors.zip(params_without_format).flatten.compact.join(" + ")
    end


    # Generate argument listing for JavaScript function
    #
    # @return [String]
    #
    # @api private
    def self.args_list(params)
      params.join(", ")
    end
  end
end

