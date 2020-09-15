require 'rails/railtie'

module SimplyInlineSvg
  class Railtie < ::Rails::Railtie
    initializer "simply_inline_svg.action_view" do |app|
      ActiveSupport.on_load :action_view do
        require "simply_inline_svg/action_view/helpers"
        include SimplyInlineSvg::ActionView::Helpers
      end
    end

  end
end
