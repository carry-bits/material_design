module MaterialDesign
  module ChipHelper
    def md_filter_chip(label=nil, leading_icon: nil, trailing_icon: nil)
      content_tag(:div, class: "chip") do
        concat(render("material_design/icons/icon", locals: { icon: leading_icon, size: 18 })) if leading_icon
        concat(content_tag(:p, label, class: "chip__label"))
        concat(render("material_design/icons/icon", locals: { icon: trailing_icon, size: 18 })) if trailing_icon
      end
    end
  end
end
