class OptionTypeAddDisplayTypeField < ActiveRecord::Migration
  def change
    add_column :spree_option_types, :display_type, :string
  end

  def down
  end
end
