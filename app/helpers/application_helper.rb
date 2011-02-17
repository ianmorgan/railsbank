module ApplicationHelper
  def errors_for_with_prefix(model, prefix)
    #model.errors.full_messages.map { |msg| content_tag(:li, "#{prefix} #{msg}" )  }
  end
  
  def render_error_messages(*objects)
    messages = objects.compact.map { |o| build_message(o)}.flatten
    render :partial => 'error_messages', :object => messages unless messages.empty?
  end
  
  
  def build_message(o)
    prefix = ""
    prefix = "#{o.formatted_applicant_type}: " if o.respond_to? "applicant_type"
    o.errors.full_messages.collect{|m| "#{prefix}#{m}"} 
  end
  
  def railsbank_fields_for(*args, &block)
    options = args.extract_options!.merge(:builder => RailsbankFormBuilder)
    fields_for(*(args +[options]), &block)
  end
  
  def observe_radio_button(button_name, on_selected, on_deselected)
    method_name = button_name.gsub('[','_').gsub(']','_')
    render :partial => "observe_radio_button",
            :locals => { :button => button_name,
                            :method => method_name,
                            :on_selected => on_selected,
                            :on_deselected => on_deselected} 
  end
end
