module Spree
  Product.class_eval do
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
