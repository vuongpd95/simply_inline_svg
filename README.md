# SimplyInlineSvg

SimplyInlineSVG is a super simple gem to help you inline SVG icons. Seriously, it's so simple that I don't even write any tests. But, I don't guarantee it works with all Ruby & Rails version though. Use this gem at your own peril.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simply_inline_svg'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simply_inline_svg

## Usage

Run `bundle exec rails generate simply_inline_svg:install` to generate an initializer file if you are using Rails. Use the initializer file to register your SVGs

```
# config/initializers/simply_inline_svg.rb
SimpleInlineSvg.register_directory(Rails.root.join("app", "assets", "images", "svgs"))
```

Then in views, you can:

```
<%= inline_svg_tag("icon-name.svg", class: "any-class") %>
```

You can also use `register_svg` to register a single svg file. This gives you the power to decide how your svg should be referenced

```
# config/initializers/simply_inline_svg.rb
SimpleInlineSvg.register_svg(:close_icon, Rails.root.join("app", "assets", "images", "svgs", "close.svg").to_s)
```

Then in views, you can:

```
<%= inline_svg_tag(:close_icon, class: "any-class") %>
```

If you want to inline an SVG compiled by Webpacker or Sprockets (Rails only). You don't have to register them, just use:

```
# For Sprockets
<%= assets_svg_tag(icon_path, class: "any-class") %>

# For Webpacker
<%= pack_svg_tag(icon_path, class: "any-class") %>
```

`icon_path` of `assets_svg_tag` is similar to `icon_path` in `image_tag(icon_path)`. `icon_path` of `pack_svg_tag` is similar to `icon_path` in `assets_pack_path(icon_path)`.

Examples

```
# For Sprockets
<%= assets_svg_tag("bed.svg", class: "any-class") %> # Render app/assets/images/bed.svg

# For Webpacker
<%= pack_svg_tag("media/images/bed.svg", class: "any-class") %> # Render app/javascript/images/bed.svg
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/vuongpd95/simply_inline_svg. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the SimplyInlineSvg project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/vuongpd95/simply_inline_svg/blob/master/CODE_OF_CONDUCT.md).
