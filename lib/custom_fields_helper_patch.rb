require_dependency 'custom_fields_helper'

module CustomFieldsHelperPatch

  def custom_field_label_tag(name, custom_value, options={})

    required = options[:required] || custom_value.custom_field.is_required?
    custom_field_name = custom_value.custom_field.name
    l_name = l(custom_field_name)
    if l_name.index('translation missing:') == 0 && l_name.index(custom_field_name) == l_name.length - custom_field_name.length
      l_name = custom_value.custom_field.description.presence
    end
    content = content_tag 'span', l_name

    content_tag 'label', content +
                           (required ? " <span class=\"required\">*</span>".html_safe : ''),
                :for => "#{name}_custom_field_values_#{custom_value.custom_field.id}"
  end

end

CustomFieldsHelper.prepend CustomFieldsHelperPatch
