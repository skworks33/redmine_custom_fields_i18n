# redmine_custom_fields_i18n
Plugin for Redmine custom fields internalization

work on 4.0.3 OK.

# What is it
Redmine is flexible system that allows many things, including custom fields.
But they can not be localized - they have name and description in one language.
In Redmine views custom fields shows name in label and description in title.
My plugin replace custom field labels and show translations from localization files.

# How to
* Install plugin, as in [guide](http://www.redmine.org/projects/redmine/wiki/Plugins)
* Add necessary translations to %plugin_or_root_folder%/config/locales/%locale%.yml:
```
en:
  custom_field_name: "MY CUSTOM FIELD LOCALIZED DESCRIPTION"
```
That translations will be used for custom field labels show.
If translation will be missed (in this case usually ```translation missing: locale.string``` message shows), custom field description will be used
