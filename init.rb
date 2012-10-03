require 'redmine'

Rails.configuration.to_prepare do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, TextFormatSelectorHelperPatch)
end

Redmine::Plugin.register :redmine_text_format_selector do
  name 'Redmine Text Format Selector plugin'
  author 'Tomohiro, TAIRA'
  description 'Add text format selector to project'
  version '0.0.5'
  url 'https://github.com/Tomohiro/redmine_text_format_selector'
  author_url 'https://github.com/Tomohiro'
end
