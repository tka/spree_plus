module Spree
  OptionValue.class_eval do
    has_one :image, :as => :viewable, :dependent => :destroy, :class_name => "Spree::Image"
    accepts_nested_attributes_for :image
  end
end
