require_dependency 'issues_helper'

module IssuesHelperPatch
  def render_half_width_custom_fields_rows(issue)
    values = issue.visible_custom_field_values.reject {|value| value.custom_field.full_width_layout?}
    return if values.empty?
    half = (values.size / 2.0).ceil
    issue_fields_rows do |rows|
      values.each_with_index do |value, i|
        css = "cf_#{value.custom_field.id}"
        attr_value = show_value(value)
        if value.custom_field.text_formatting == 'full'
          attr_value = content_tag('div', attr_value, class: 'wiki')
        end
        m = (i < half ? :left : :right)

        # To Internationalization
        l_name = l(value.custom_field.name)
        unless l_name.index('translation missing:') == 0 || l_name.index(value.custom_field.name) == l_name.length - value.custom_field.name.length
          value.custom_field.name = l_name
        end

        rows.send m, custom_field_name_tag(value.custom_field), attr_value, :class => css
      end
    end
  end
end

IssuesHelper.prepend IssuesHelperPatch
