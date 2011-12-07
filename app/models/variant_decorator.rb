module Spree
  Variant.class_eval do
    # 識別使用相同的圖片貨號用
    def images_id
          option_values.sort { |ov1, ov2| ov1.option_type.position <=> ov2.option_type.position }.reject{|ov| ov.option_type.has_same_product_image}.inject(""){|a,b| a+="#{b.id}-"}
    end

    def first_image_variant
      self.product.variants.each do  | variant |
        return variant if variant.images_id == self.images_id && variant.images.count > 0
      end
      nil
    end
  end
end
