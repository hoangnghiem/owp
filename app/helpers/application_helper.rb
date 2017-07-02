module ApplicationHelper

  def page_header(&block)
    concat content_tag(:div, capture(&block), class: 'owp-page-header')
  end

  def page_body(options={}, &block)
    default_classes = %w{owp-page-body uk-margin-small uk-padding-small uk-background-default}
    default_classes.delete("uk-padding-small") if options[:no_padding]
    default_classes.delete("uk-background-default") if options[:no_background]
    concat content_tag(:div, capture(&block), class: default_classes)
  end

end
