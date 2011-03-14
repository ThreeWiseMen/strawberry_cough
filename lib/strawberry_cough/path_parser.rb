module StrawberryCough

  class PathParser
    PARAM_PATTERN = /:([\w_\d]+)\(*/
    SPLIT_ME = "{}{}}{}{}}{}"

    def self.parse_params(path)
      path.scan(PARAM_PATTERN).flatten
    end

    def self.parse_anchors(path)
      path.gsub(/\(.*\)/, '').gsub(PARAM_PATTERN, SPLIT_ME).split(SPLIT_ME)
    end
  end
end
