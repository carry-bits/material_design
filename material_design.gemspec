require_relative "lib/material_design/version"

Gem::Specification.new do |spec|
  spec.name        = "material_design"
  spec.version     = MaterialDesign::VERSION
  spec.authors     = ["Eduardo Yutaka Nakanishi", "Mariana Negrão Trancoso"]
  spec.email       = ["eduardo.nakanishi@gmail.com"]
  spec.homepage    = "https://rubygems.org/gems/material_design"
  spec.summary     = "Material Design"
  spec.description = "Material is Google’s open-source design system. Design and build beautiful, usable products with Material."
  spec.license     = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the "allowed_push_host"
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_runtime_dependency "rails", ">= 7.1.3"
end
