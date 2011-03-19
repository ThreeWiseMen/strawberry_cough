module StrawberryCough

  # Parses a path into anchors and parameters
  class PathParser
    PARAM_PATTERN = /:([\w_\d]+)\(*/
    SPLIT_ME = "{}{}}{}{}}{}"

    # Get list of parameters from a path
    #
    # @return [Array]
    #
    # @api private
    def self.parse_params(path)
      path.scan(PARAM_PATTERN).flatten
    end

    # Get list of anchors from a path
    #
    # @return [Array]
    #
    # @api private
    def self.parse_anchors(path)
      path.gsub(/\(.*\)/, '').gsub(PARAM_PATTERN, SPLIT_ME).split(SPLIT_ME)
    end
  end
end
