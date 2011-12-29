Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "add_product_tabs",
                     :insert_after => "code[erb-loud]:contains(':properties')",
                     :text => "
  <%= tab :labels, :match_path => '/labels' %>
  <%= tab :links, :match_path => '/links' %>

",
  :disabled => false)
