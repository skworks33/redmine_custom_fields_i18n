require_dependency 'custom_fields_helper'

module CustomFieldsHelperPatch
  def custom_field_label_tag(name, custom_value, options={})
    required = options[:required] || custom_value.custom_field.is_required?
    for_tag_id = options.fetch(:for_tag_id, "#{name}_custom_field_values_#{custom_value.custom_field.id}")

    # To Internationalization
    l_name = l(custom_value.custom_field.name)
    unless l_name.index('translation missing:') == 0 && l_name.index(custom_value.custom_field.name) == l_name.length - custom_value.custom_field.name.length
      custom_value.custom_field.name = l_name
    end

    content = custom_field_name_tag custom_value.custom_field

    content_tag "label", content +
      (required ? " <span class=\"required\">*</span>".html_safe : ""),
      :for => for_tag_id
  end
end

CustomFieldsHelper.prepend CustomFieldsHelperPatch
