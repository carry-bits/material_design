module MaterialDesign
  module ButtonHelper
    def md_button_to(name, options = nil, html_options = {})
      style = html_options[:style] || "filled"
      variant = html_options[:variant] || "primary"
      html_options[:class] = "button--container button__#{style}--#{variant}"
      button_to(options, html_options.except(:style)) do
        content_tag(:div, class: "layer-state layer-state__#{style}") do
          content_tag(:div, class: "button--content") do
            name
          end
        end
      end
    end

    def md_button_tag(label)
      content_tag(:p, label, class: "test-hehe")
    end
  end
end

