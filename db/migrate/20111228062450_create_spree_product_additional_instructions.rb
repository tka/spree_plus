class CreateSpreeProductAdditionalInstructions < ActiveRecord::Migration
  def change
    create_table :spree_product_additional_instructions do |t|
      t.string :type
      t.string :name
      t.text :content
      t.timestamps
    end
  end
end
