require "rails/railtie"

module MyGem
  class Railtie < Rails::Railtie
    initializer "material_design.action_controller" do
      ActiveSupport.on_load(:action_controller_base) do #quando a base controller for carregada
        helper MaterialDesign::ButtonHelper #disponibiliza o helper em todos os arquivos
        helper MaterialDesign::ChipHelper
        helper MaterialDesign::MenuHelper
      end
    end
  end
end
