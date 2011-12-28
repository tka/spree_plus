class CreateSpreeProductAdditionalInstructionsProducts < ActiveRecord::Migration
  def change
    create_table :spree_product_additional_instructions_products do |t|
      t.string :product_additional_instruction_id
      t.string :product_id
      t.timestamps
    end
  end
end
