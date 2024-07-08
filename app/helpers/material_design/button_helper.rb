module MaterialDesign
  module ButtonHelper
    def md_button_to(label, path, variant: "filled", method: "post", type: "submit", disabled: false, **options)
      form_options = { method: method, action: path, class: "common-button--container common-button__#{variant}" }

      options.except(:data).each do |key, value|
        form_options[key] = value
      end

      input_options = { value: label, type: type, class: "layer-state layer-state__#{variant} text-sm" }
      if options[:data]
        options[:data].each do |key, value|
          input_options["data-#{key.to_s.dasherize}"] = value
        end
      end

      content_tag(:form, form_options) do
        content_tag(:input, input_options) do
          content_tag(:div, class: 'common-button--content') do
          end
        end
      end
    end

    def md_button_tag(label, path, name: "button", type: "submit", disabled: false)
      content_tag(:button, name: name, type: type, disabled: disabled, class: 'common-button--container common-button__outlined') do
        content_tag(:div, class: 'layer-state layer-state__outlined') do
          content_tag(:div, class: 'common-button--content') do
            label
          end
        end
      end
    end
  end
end
