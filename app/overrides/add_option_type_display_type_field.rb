Deface::Override.new(:virtual_path => "spree/admin/option_types/_form",
                     :name => "add_option_type_display_type_field",
                     :insert_before => "code[erb-loud]:contains('f.field_container :presentation')",
                     :text => "
<%= f.field_container :display_type do %>
  <%= f.label :display_type, t(:display_type) %><br />
  <%= f.select :display_type, [:radio, :select] %>
  <%= f.error_message_on :display_type %>
<% end %>
<%= f.field_container :has_same_product_image do %>
  <%= f.label :has_same_product_image, t(:has_same_product_image) %><br />
  <%= f.check_box :has_same_product_image %>
  <%= f.error_message_on :has_same_product_image %>
<% end %>
<%= f.field_container :position do %>
  <%= f.label :position, t(:position) %><br />
  <%= f.text_field :position %>
  <%= f.error_message_on :position %>
<% end %>

",
  :disabled => false)
