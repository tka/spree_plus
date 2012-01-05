module Spree
  Image.class_eval do
    has_attached_file :attachment,
      :styles => { :mini => '50x50>', :small => '120x120>', :product => '250x250>', :large => '600x600>' },
      :default_style => :product,
      :url => '/spree/products/:id/:style/:basename.:extension',
      :path => ':rails_root/public/spree/products/:id/:style/:basename.:extension'

  end
end
