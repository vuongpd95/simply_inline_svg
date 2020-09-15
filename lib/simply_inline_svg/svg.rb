require 'xml'

module SimplyInlineSvg
  class Svg

    def initialize(str_svg)
      @doc = XML::Parser.string(str_svg).parse
      @svg_attributes = @doc.root.attributes
    end

    def []=(attr_name, attr_value)
      @svg_attributes[attr_name.to_s] = attr_value.to_s
    end

    def [](attr_name)
      @svg_attributes[attr_name.to_s]
    end

    def dup
      self.class.new(@doc.to_s)
    end

    def to_s
      @doc.to_s
    end

    def render(options = {})
      return self.to_s if options.empty?
      cloned_svg = self.dup
      options.each { |k, v| cloned_svg[k] = v }
      cloned_svg.to_s
    end
  end
end
