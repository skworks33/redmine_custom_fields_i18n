require 'redmine'

require_dependency 'custom_fields_helper_patch'
require_dependency 'issues_helper_patch'

Redmine::Plugin.register :redmine_custom_fields_i18n do
  name 'Custom Fields I18n plugin'
  author 'skworks33 and General Failure'
  description 'Internationalization for Redmine custom fields'
  version '0.0.3'
  url 'https://github.com/skworks33/redmine_custom_fields_i18n'
  author_url 'https://github.com/skworks33'
end
