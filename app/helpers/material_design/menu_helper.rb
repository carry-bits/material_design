module MaterialDesign
  module MenuHelper
    def md_menu(menu_options: [], data: {}, form: nil, attribute: nil)
      content_tag(:div, class: "menu", data: data) do
        menu_options.each do |option|
          concat(dropdown_menu_option(option, form, attribute))
        end
      end
    end

    def dropdown_menu_option(option, form, attribute)
      if option[:path]
        link_to option[:path], data: option[:data], method: option[:method] do
          content_tag(:div, class: class_names("menu__item", divider: option[:divider])) do
            concat(render("material_design/icons/icon", locals: { icon: option[:icon], size: 18 })) if option[:icon]
            concat(content_tag(:span, option[:label]))
          end
        end
      elsif form
        form.label "#{attribute}_#{option[:value]}", option[:label] do
          concat(form.radio_button attribute, option[:value], class: "hidden", onchange: option[:onchange], checked: option[:checked])
          concat(content_tag(:div, class: class_names("menu__item", divider: option[:divider])) do
            concat(render("material_design/icons/icon", locals: { icon: option[:icon], size: 18 })) if option[:icon]
            concat(content_tag(:span, option[:label]))
          end)
        end
      end
    end
  end
end

