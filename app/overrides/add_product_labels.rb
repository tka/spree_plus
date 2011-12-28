Deface::Override.new(:virtual_path => "spree/products/show",
                     :name => "add_product_labels",
                     :insert_before => "#cart-form",
                     :text => " <%= render_cell :product, :labels, :product => @product%>",
                     :disabled => false)
