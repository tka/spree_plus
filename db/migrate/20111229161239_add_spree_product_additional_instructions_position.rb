class AddSpreeProductAdditionalInstructionsPosition < ActiveRecord::Migration
  def change
    add_column :spree_product_additional_instructions, :position, :integer
  end
end
