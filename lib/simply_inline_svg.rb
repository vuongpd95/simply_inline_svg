require "simply_inline_svg/version"
require "simply_inline_svg/svg"
require "simply_inline_svg/storage"
require "simply_inline_svg/railtie" if defined?(Rails)

module SimplyInlineSvg
  class Error < StandardError; end
  class SvgNotFound < Error; end
end
