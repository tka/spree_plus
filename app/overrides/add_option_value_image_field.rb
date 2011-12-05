Deface::Override.new(:virtual_path => "spree/admin/option_types/edit",
                     :name => "add_option_value_image_field_thead",
                     :insert_bottom => "thead[data-hook='option_header'] th:nth-child(2)",
                     :text => "<th><%=t('image')%></th>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/option_types/edit",
                     :name => "add_option_value_image_field_tbody_border",
                     :insert_bottom => "tr[data-hook='option_none']",
                     :text => "<td></td>",
                     :disabled => false)

Deface::Override.new(:virtual_path => "spree/admin/option_types/_option_value_fields",
                     :name => "add_option_value_image_field",
                     :insert_after => "td.presentation",
                     :text => '<td>
                     <%=image_tag f.object.image.mini_url if f.object.image%>
                      <%= f.fields_for :image_attributes do |fn|%>
                     <%= fn.file_field :attachment %>
                     <% end %></td>',
                     :disabled => false)
