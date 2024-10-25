require "rails/railtie"

module MyGem
  class Railtie < Rails::Railtie
    initializer "material_design.action_controller" do
      ActiveSupport.on_load(:action_controller_base) do
        helper MaterialDesign::ButtonHelper
        helper MaterialDesign::ChipHelper
      end
    end
  end
end
