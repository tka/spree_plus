Spree::ProductsHelper.module_eval do
  def variant_option_values_data(v)
    v.option_values.inject("") do |result, current|  
      result = result + "data-option-type-#{current.option_type_id}=\"#{current.id}\" "
    end
  end

end


