module BreadcrumbHelper

  def render_breadcrumbs
    if @breadcrumbs
      content_tag :ul, class: 'uk-breadcrumb' do
        concat breadcrumb_root
        @breadcrumbs.each do |name, url|
          if url
            concat breadcrumb_item(name, url)
          else
            concat breadcrumb_active(name)
          end
        end
      end
    end
  end

  private

  def breadcrumb_root
    content_tag :li, class: 'root uk-disabled' do
      link_to '#' do
        content_tag :i, '', class: 'fa fa-home'
      end
    end
  end

  def breadcrumb_item(name, url)
    content_tag :li do
      link_to name, url
    end
  end

  def breadcrumb_active(name)
    content_tag :li do
      content_tag :span, name
    end
  end

end
