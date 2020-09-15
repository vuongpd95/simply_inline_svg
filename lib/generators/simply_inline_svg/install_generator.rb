# frozen_string_literal: true
require 'rails/generators/base'

module SimplyInlineSvg
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../../templates", __FILE__)
      desc "Creates SimplyInlineSvg initializer for your application"

      def copy_initializer
        template "simply_inline_svg_initializer.rb", "config/initializers/simply_inline_svg.rb"

        puts "Install complete!"
      end
    end
  end
end
