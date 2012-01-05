module Spree
  module SpreePlusHelper
    def spreeplus_breadcrumbs(taxon, separator="")
      return "" if current_page?("/") || taxon.nil?
      separator = raw(separator)
      crumbs = [content_tag(:li, link_to(t(:home) , root_path) + separator, :class => 'home')]
      if taxon
        crumbs << content_tag(:li, link_to(t(:products) , products_path) + separator)
        crumbs << taxon.ancestors.collect { |ancestor| content_tag(:li, link_to(ancestor.name , seo_url(ancestor)) + separator) } unless taxon.ancestors.empty?
        crumbs << content_tag(:li, content_tag(:span, taxon.name))
      else
        crumbs << content_tag(:li, content_tag(:span, t(:products)))
      end
      crumb_list = content_tag(:ul, raw(crumbs.flatten.map{|li| li.mb_chars}.join), :class => 'clearfix')
      content_tag(:div,
          content_tag(:div, crumb_list, :class => 'inner'),
          :id => 'breadcrumbs')

    end

    def sidebar_class
      content_for?(:sidebar) ? 'has-sidebar' : ''
    end
  end
end
