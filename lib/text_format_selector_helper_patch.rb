module TextFormatSelectorHelperPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :wiki_helper,  :text_format_select
      alias_method_chain :textilizable, :text_format_select
    end
  end

  module InstanceMethods
    def wiki_helper_with_text_format_select
      helper = Redmine::WikiFormatting.helper_for(project_formatter(@project))
      extend helper
      return self
    end

    # Monkey patch to ApplicationHelper::textilizable
    def textilizable_with_text_format_select(*args)
      options = args.last.is_a?(Hash) ? args.pop : {}
      case args.size
      when 1
        obj = options[:object]
        text = args.shift
      when 2
        obj = args.shift
        attr = args.shift
        text = obj.send(attr).to_s
      else
        raise ArgumentError, 'invalid arguments to textilizable'
      end
      return '' if text.blank?
      project = options[:project] || @project || (obj && obj.respond_to?(:project) ? obj.project : nil)
      only_path = options.delete(:only_path) == false ? false : true

      text = Redmine::WikiFormatting.to_html(project_formatter(project), text, :object => obj, :attribute => attr)

      @parsed_headings = []
      @heading_anchors = {}
      @current_section = 0 if options[:edit_section_links]

      parse_sections(text, project, obj, attr, only_path, options)
      text = parse_non_pre_blocks(text) do |text|
        [:parse_inline_attachments, :parse_wiki_links, :parse_redmine_links, :parse_macros].each do |method_name|
          send method_name, text, project, obj, attr, only_path, options
        end
      end
      parse_headings(text, project, obj, attr, only_path, options)

      if @parsed_headings.any?
        replace_toc(text, @parsed_headings)
      end

      text.html_safe
    end

    def project_formatter(project)
      return Setting.text_formatting unless project
      project.custom_field_values.find(lambda { Setting.text_formatting }) do |v|
        Redmine::WikiFormatting.format_names.include? v.value
      end
    end
  end
end
