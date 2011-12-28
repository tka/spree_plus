Deface::Override.new(:virtual_path => "spree/admin/shared/_product_sub_menu",
                     :name => "add_product_tabs",
                     :insert_after => "code[erb-loud]:contains(':properties')",
                     :text => "
<%= tab :labels %>
<%= tab :links %>

",
  :disabled => false)
