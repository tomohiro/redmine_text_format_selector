require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :redmine_text_format_selector do
  require_dependency 'application_helper'
  ApplicationHelper.send(:include, TextFormatSelectorHelperPatch)
end

Redmine::Plugin.register :redmine_text_format_selector do
  name 'Redmine Text Format Selector plugin'
  author 'Tomohiro, TAIRA'
  description 'Add text format selector to project'
  version '0.0.3'
  url 'http://github.com/Tomohiro/redmine_text_format_selector'
  author_url 'http://github.com/Tomohiro'
end
