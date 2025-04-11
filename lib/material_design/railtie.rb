require "rails/railtie"

module MaterialDesign
  class Railtie < Rails::Railtie
    initializer "material_design.action_controller" do
      ActiveSupport.on_load(:action_controller_base) do 
        helper MaterialDesign::ButtonHelper
        helper MaterialDesign::ChipHelper
        helper MaterialDesign::MenuHelper
      end
    end
  end
end
