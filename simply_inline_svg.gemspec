lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "simply_inline_svg/version"

Gem::Specification.new do |spec|
  spec.name          = "simply_inline_svg"
  spec.version       = SimplyInlineSvg::VERSION
  spec.authors       = ["Vuong Pham"]
  spec.email         = ["vuongpd95@gmail.com"]

  spec.summary       = %q{SimplyInlineSVG helps you inline svg images into HTML template in a (really) simple way.}
  spec.homepage      = "https://chilling.dev/open-source/simply-inline-svg"
  spec.license       = "MIT"

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/vuongpd95/simply_inline_svg"
  spec.metadata["changelog_uri"] = "https://github.com/vuongpd95/simply_inline_svg/blob/v#{SimplyInlineSvg::VERSION}/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "libxml-ruby", ">= 2.7", "~> 3.2"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry", "~> 0.12.2"
end
