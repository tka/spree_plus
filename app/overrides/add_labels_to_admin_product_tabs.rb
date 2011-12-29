Deface::Override.new(:virtual_path => "spree/admin/shared/_product_tabs",
                     :name => "add_labels_and_links_to_admin_product_tabs",
                     :insert_bottom => "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
                     :text => "    <li<%== ' class=\"active\"' if current == \"Labels\" %>>
      <%= link_to t(\"labels\"), spree.available_admin_product_labels_path(@product) %>
    </li>
    <li<%== ' class=\"active\"' if current == \"Links\" %>>
      <%= link_to t(\"links\"), spree.available_admin_product_links_path(@product) %>
    </li>
",
                     :disabled => false)
