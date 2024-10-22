require "importmap-rails"
require "stimulus-rails"

module MaterialDesign
  class Engine < ::Rails::Engine
    isolate_namespace MaterialDesign

    initializer "material_design.assets" do |app|
      app.config.assets.paths << root.join("app/javascript")
      app.config.assets.precompile += %w[ material_design_manifest ]
    end

    initializer "material_design.importmap", before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/javascript")
    end
  end
end
