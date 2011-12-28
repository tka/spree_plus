module Spree
  Product.class_eval do
    has_and_belongs_to_many :additional_instructions, 
                            :class_name => "Spree::ProductAdditionalInstruction",
                            :join_table => "spree_product_additional_instructions_products"

    has_and_belongs_to_many :labels,
                            :class_name => "Spree::ProductLabel", 
                            :join_table => "spree_product_additional_instructions_products", 
                            :association_foreign_key => :product_additional_instruction_id

    has_and_belongs_to_many :links,
                            :class_name => "Spree::ProductLink", 
                            :join_table => "spree_product_additional_instructions_products", 
                            :association_foreign_key => :product_additional_instruction_id



    after_save :update_variants_status

    def update_variants_status
      options_data=[]

      if variants_including_master.count > 1
        variants_including_master.each do |variant|
          id_str = variant.images_id
          if options_data.include?(id_str) || variant.is_master
            variant.update_attribute(:is_show_in_list_page, false)
          else
            options_data.push(id_str)
            variant.update_attribute(:is_show_in_list_page, true)
          end
        end
      end
    end
  end
end
