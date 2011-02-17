class RailsbankFormBuilder < ActionView::Helpers::FormBuilder
  %w[text_field select].each do |method_name|
    define_method(method_name) do |field_name, *args|
      options = args.extract_options!
      '<div class="lableleft"' + field_id_if_specified(options) + '>' + mandatory_or_optional(options)  +
        label(options[:label_text] || field_name) +
        super +
      '</div>'
    end
    
    def mandatory_or_optional (options)
      if options[:optional] == true
        @template.content_tag(:span, ' ', :class => "optional" )
      else
        @template.content_tag(:span, '*', :class => "mandatory" )
      end
    end
  end
  
  def objectify_options(options)
    super.except(:optional, :field_id, :label_text)
  end
  
  def underscored_object_name
    object_name.gsub('[', "_").gsub(']', '')
  end
  
  def field_id_if_specified (options)
    if options[:field_id]
      'id = "' + options[:field_id] + '"'
    else
      ''
    end
  end
  

  
end