Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_product_links",
                     :insert_after => '[data-hook="product_description"]',
                     :text => " <%= render_cell :product, :links, :product => @product%>",
                     :disabled => false)
