module StrawberryCough
  class PathParser
    PARAM_PATTERN = /:([\w_\d]+)/
    ANCHOR_PATTERN = /\/([\w_\d]+)/

    def self.parse_params(path)
      path.scan(PARAM_PATTERN).flatten
    end

    def self.parse_anchors(path)
      path.scan(ANCHOR_PATTERN).flatten
    end
  end
end
