class Spree::ProductAdditionalInstruction < ActiveRecord::Base
  default_scope :order => 'position ASC'

  has_and_belongs_to_many :products, 
                          :class_name => "Spree::Product", 
                          :join_table => "spree_product_additional_instructions_products"
end
