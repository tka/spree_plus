class AddIsShowInListPage < ActiveRecord::Migration
  def change
    add_column :spree_variants, :is_show_in_list_page, :boolean, :default => true
  end

end
