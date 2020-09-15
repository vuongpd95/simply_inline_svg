module SimplyInlineSvg
  module ActionView
    module Helpers
      def inline_svg_tag(name, options = {})
        SimplyInlineSvg::Storage.find!(name).render(options).html_safe
      end

      def assets_svg_tag(name, options = {})
        asset_name = "sprockets/#{name}"
        svg = SimplyInlineSvg::Storage.find(asset_name)
        return svg.render(options).html_safe if svg
        if ::Rails.application.config.assets.compile
          SimplyInlineSvg::Storage.register_svg(asset_name, ::Rails.application.assets[name].filename)
        else
          ::Rails.application.assets_manifest.assets.each do |k, v|
            next unless k[-3..-1] == 'svg'
            SimplyInlineSvg::Storage.register_svg(
              "sprockets/#{k}",
              "#{::Rails.application.assets_manifest.directory}/#{v}"
            )
          end
        end
        inline_svg_tag(asset_name, options)
      end

      def pack_svg_tag(name, options = {})
        pack_name = "webpacker/#{name}"
        svg = SimplyInlineSvg::Storage.find(pack_name)
        return svg.render(options).html_safe if svg
        if Webpacker.manifest.config.compile? && !Webpacker.manifest.dev_server.running?
          Webpacker.manifest.compiler.compile
        end
        pack_dir = Rails.root.join("public").to_s
        Webpacker.manifest.refresh.each do |k, v|
          next unless k[-3..-1] == 'svg'
          SimplyInlineSvg::Storage.register_svg("webpacker/#{k}", pack_dir + v)
        end
        inline_svg_tag(asset_name, options)
      end

    end
  end
end
