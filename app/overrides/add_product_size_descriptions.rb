Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_product_size_descriptions",
                     :insert_after => '[data-hook="product_description"]',
                     :text => " <%= render_cell :product, :size_descriptions, :product => @product%>",
                     :disabled => false)
