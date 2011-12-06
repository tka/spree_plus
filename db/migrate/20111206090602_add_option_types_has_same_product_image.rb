class AddOptionTypesHasSameProductImage < ActiveRecord::Migration
  def change
    add_column :spree_option_types, :has_same_product_image, :boolean, :default => false
  end

end
