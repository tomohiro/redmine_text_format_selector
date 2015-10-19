require "redmine_text_format_selector/version"
require 'text_format_selector_helper_patch'

module RedmineTextFormatSelector
  class Plugin < ::Rails::Engine
    config.after_initialize do
      require File.expand_path("../../init", __FILE__)
    end
  end
end
