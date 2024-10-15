module MaterialDesign
  module ChipHelper
    def md_filter_chip(label=nil, leading_icon: nil, trailing_icon: nil, selected: false, data: {})
      content_tag(:div, class: class_names("chip", selected: selected), data: data) do
        if selected
          concat(render("material_design/icons/icon", locals: { icon: "check", size: 18 }))
        else
          concat(render("material_design/icons/icon", locals: { icon: leading_icon, size: 18 })) if leading_icon
        end
        concat(content_tag(:p, label, class: "chip__label"))
        concat(render("material_design/icons/icon", locals: { icon: trailing_icon, size: 18 })) if trailing_icon
      end
    end
  end
end
