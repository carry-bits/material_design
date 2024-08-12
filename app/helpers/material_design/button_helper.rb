module MaterialDesign
  module ButtonHelper
    def md_button_to(name = nil, options = nil, html_options = {})
      variant = html_options[:variant] || "filled"
      color = html_options[:color] || "primary"
      icon = html_options[:icon]
      html_options[:class] = "button--container button__#{variant}--#{color}"

      button_to(options, html_options.except(:variant, :color, :icon)) do
        content_tag(:div, class: "layer-state layer-state__#{variant}") do
          content_tag(:div, class: "button--content") do
            concat(render("material_design/icons/icon", locals: { icon: icon, size: 18 })) if icon
            concat(name)
          end
        end
      end
    end

    def md_button_tag(name = nil, content_or_options = nil, html_options = {})
      variant = html_options[:variant] || "filled"
      color = html_options[:color] || "primary"
      icon = html_options[:icon]
      html_options[:class] = "button--container button__#{variant}--#{color}"

      button_tag(content_or_options, html_options.except(:variant, :color)) do
        content_tag(:div, class: "layer-state layer-state__#{variant}") do
          content_tag(:div, class: "button--content") do
            concat(render("material_design/icons/icon", locals: { icon: icon, size: 18 })) if icon
            concat(name)
          end
        end
      end
    end
  end
end

