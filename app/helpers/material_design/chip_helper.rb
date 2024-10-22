module MaterialDesign
  module ChipHelper
    def md_filter_chip(label=nil, leading_icon: nil, trailing_icon: nil, selected: false, data: {}, &block)
      merged_data = data.merge(controller: "filter-chip", filter_chip_selected_value: selected, action: "#{block_given? ? "click->filter-chip#toggleDropdown" : "click->filter-chip#toggleSelect"}")

      chip_content = content_tag(:div, class: "chip__container", data: merged_data) do
        concat(content_tag(:div, class: class_names("chip", selected: selected), data: { filter_chip_target: "chip"}) do
          concat(content_tag(:span, class: "hidden", data: {filter_chip_target: "selectedIcon"}) do
            render("material_design/icons/icon", locals: { icon: "check", size: 18 })
          end)
          concat(content_tag(:span, data: {filter_chip_target: "leadingIcon"}) do
            render("material_design/icons/icon", locals: { icon: leading_icon, size: 18 }) if leading_icon
          end)
          concat(content_tag(:p, label, class: "chip__label", data: {filter_chip_target: "label"}))
          concat(content_tag(:span, data: {filter_chip_target: "chevronIcon"}) do
            render("material_design/icons/icon", locals: { icon: "arrow_drop_down", size: 18 })
          end) if block_given?
          concat(content_tag(:span, data: {filter_chip_target: "trailingIcon"}) do
            render("material_design/icons/icon", locals: { icon: trailing_icon, size: 18 }) if trailing_icon && !block_given?
          end)
        end)
        if block_given?
          concat(content_tag(:div,  class: "hidden chip__dropdown", data: {filter_chip_target: "dropdown"}) do
            capture(&block)
          end)
        end
      end

      chip_content
    end
  end
end
