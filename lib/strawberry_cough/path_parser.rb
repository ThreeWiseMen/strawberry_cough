module StrawberryCough

  # Parses a path into anchors and parameters
  class PathParser
    PARAM_EXTRACTOR_PATTERN = /:([\w_\d]+)\(*/
    ANCHOR_SPLIT_PATTERN = /:[\w_\d]+/

    # Get list of parameters from a path
    #
    # @return [Array]
    #
    # @api private
    def self.parse_params(path)
      path.scan(PARAM_EXTRACTOR_PATTERN).flatten
    end

    # Get list of anchors from a path
    #
    # @return [Array]
    #
    # @api private
    def self.parse_anchors(path)
      remove_format(path).split(ANCHOR_SPLIT_PATTERN)
    end

    def self.remove_format(path)
      path.gsub(/\(.*\)/, '')
    end
  end
end
