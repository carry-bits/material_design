module MaterialDesign
  class Engine < ::Rails::Engine
    isolate_namespace MaterialDesign

    initializer "material_design.importmap", before: "importmap" do |app|
      app.config.importmap.paths << root.join("config/importmap.rb")
      app.config.importmap.cache_sweepers << root.join("app/assets/javascripts")
    end

    # initializer "my-engine.assets" do |app|
    #   # Garantir que os assets do engine sejam pré-compilados em produção
    #   app.config.assets.precompile += %w[my_engine_manifest]
    # end
  end
end
