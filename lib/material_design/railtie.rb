require "rails/railtie"

module MyGem
  class Railtie < Rails::Railtie  #add uma funcionalidade a um app rails a partir de uma gem
    initializer "material_design.action_controller" do
      ActiveSupport.on_load(:action_controller_base) do #quando a base controller for carregada
        helper MaterialDesign::ButtonHelper #disponibiliza o helper em todos os arquivos
        helper MaterialDesign::ChipHelper
      end
    end
  end
end
