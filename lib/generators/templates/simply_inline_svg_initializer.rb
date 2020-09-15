# Register all svg images under assets
# SimplyInlineSvg::Storage.register_directory(Rails.root.join("app", "assets", "images"))
# Example:
#   app/assets/images/dir/bed.svg
#   app/assets/images/bathroom.svg
#   app/assets/images/bed.svg
# In view templates
#   inline_svg_tag("bed.svg")        => Render app/assets/images/bed.svg
#   inline_svg_tag("bathroom.svg")   => Render app/assets/images/bathroom.svg
# Only the last svg registered if there're multiple svgs with the same name. If you want to keep
# all of them, use SimplyInlineSvg::Storage#register_svg
#   SimplyInlineSvg::Storage.register_svg("dir/bed.svg", Rails.root.join("app", "assets", "images", "dir", "bed.svg"))
#   SimplyInlineSvg::Storage.register_svg("bed.svg", Rails.root.join("app", "assets", "images", "bed.svg"))
# Then, in view templates
#   inline_svg_tag("bed.svg")        => Render app/assets/images/bed.svg
#   inline_svg_tag("dir/bed.svg")    => Render app/assets/images/dir/bed.svg

# If you want to render an svg compiled by Sprockets or Webpacker, use:
#   assets_svg_tag("bed.svg")              => Render app/assets/images/bed.svg
#   pack_svg_tag("media/images/bed.svg")   => Render app/javascript/images/bed.svg
