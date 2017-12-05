module ApplicationHelper

  def owp_form_for(object, *args, &block)
    options = args.extract_options!
    form_object = (object.kind_of?(BaseForm) && object.respond_to?(:model)) ? object.model : object
    options[:url] ||= if options.key?(:format)
                        polymorphic_path(form_object, format: options.delete(:format))
                      else
                        polymorphic_path(form_object, {})
                      end
    simple_form_for(object, *(args << options), &block)
  end

end
