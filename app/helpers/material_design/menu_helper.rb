module MaterialDesign
  module MenuHelper
    def md_menu(menu_options: [], data: {})
      content_tag(:div, class: "dropdown-menu hidden", data: data) do
        menu_options.each do |option|
          concat(dropdown_menu_option(option))
        end
      end
    end

    def dropdown_menu_option(option)
      link_to option[:path], data: option[:data], method: option[:method] do
        content_tag(:div, class: class_names("dropdown-item", divider: option[:divider])) do
          concat(render("material_design/icons/icon", locals: { icon: option[:icon], size: 18 })) if option[:icon]
          concat(content_tag(:span, option[:label]))
        end
      end
    end
  end
end
