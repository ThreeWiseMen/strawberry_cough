module StrawberryCough

  # Compiles a path to a JavaScript function
  class PathCompiler

    # Compile path to JavaScript function
    #
    # @returns [String]
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

    # Compile anchors and parameters into JavaScript statement that
    # concatenates them into a valid URL
    #
    # @returns [String]
    #
    # @api private
    def self.url_concatenation(anchors, params)
      params_without_format = params.reject { |p| p == "format" }
      quoted_anchors = anchors.map { |a| "\"#{a}\"" }
      anchors_paired_with_params = quoted_anchors.zip(params_without_format)
      anchors_paired_with_params.flatten.compact.join(" + ")
    end


    # Compile parameter list into a function argument list for a
    # JavaScript function
    #
    # @returns [String]
    #
    # @api private
    def self.args_list(params)
      params.join(", ")
    end
  end
end

