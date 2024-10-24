module MaterialDesign
  module DropdownMenuHelper
    def md_dropdown_menu(leading_icon: nil, menu_options: [], data: {})
      merged_data = data.merge(controller: "dropdown-menu", action: "click->dropdown-menu#toggleDropdown")
      content_tag(:div, class: "dropdown-container", data: merged_data) do
        concat(
          content_tag(:button, class: "dropdown-button") do
            concat(render("material_design/icons/icon", locals: { icon: leading_icon, size: 18 })) if leading_icon
          end
        )
        concat(
          content_tag(:div, class: "dropdown-menu hidden", data: { dropdown_menu_target: "menu" }) do
            menu_options.each do |option|
              concat(dropdown_menu_option(option))
            end
          end
        )
      end
    end

    private

    def dropdown_menu_option(option)
      link_to option[:path], class: "dropdown-item", data: option[:data], method: option[:method] do
        concat(render("material_design/icons/icon", locals: { icon: option[:icon], size: 18 })) if option[:icon]
        concat(content_tag(:span, option[:label], class: "dropdown-item__label"))
      end
    end
  end
end
