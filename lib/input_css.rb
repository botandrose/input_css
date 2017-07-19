require "input_css/version"

# Modifies the 'options' of the tag helper so that, by default,
# there's a CSS class attribute based on the type attribute
# (Note: only applies to input fields)
module InputCSS
  def tag(name, options=nil, open=false, escape=true)
    options = css_options_for_tag(name, options)
    super
  end

  def css_options_for_tag(name, options)
    options = HashWithIndifferentAccess.new(options)
    return options if options[:type] == 'hidden'

    # alter CSS class based on type
    # (only for <input ... /> tags)
    if name.to_s.downcase =~ /^input$/
      type, css = options[:type], options[:class]
      type = 'text' if type == 'password'
      options[:class] = "#{css.to_s} #{type.to_s}".gsub!(/^\s*/, '') unless css && css.split.include?(type)
    end
    options
  end
  module_function :css_options_for_tag
end

module ActionView
  module Helpers
    module TagHelper
      if respond_to?(:prepend) # Rails 5 compat
        prepend InputCSS
      else
        def tag_with_default_css(name, options=nil, open=false, escape=true)
          options = InputCSS.css_options_for_tag(name, options)
          tag_without_default_css(name, options, open, escape)
        end
        alias_method_chain :tag, :default_css
      end
    end

    class InstanceTag
      alias_method :tag_without_error_wrapping, :tag_with_default_css
    end if defined?(InstanceTag) # Rails 3 compat
  end
end

