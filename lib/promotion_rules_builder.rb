require_relative 'promotion_rules'
require 'json'

class PromotionRulesBuilder
  def initialize(file)
    @data_hash = JSON.parse(file)
  end

  def build
    pr = PromotionRules.new(
        set_min_discount_basket_value,
        set_basket_discount_rate,
        set_discount_products_list,
        set_discounted_products_prices_list
    ) 
  end

  def set_basket_discount_rate
    @basket_discount = @data_hash['qualitative_rule']['basket_discount_rate'].to_f
  end

  def set_min_discount_basket_value
    @basket_min_value = @data_hash['qualitative_rule']['basket_min_value'].to_f
  end 

  def set_discount_products_list
    @discount_product_list = [] 
    @data_hash['quantitative_rule']['items'].each do |item| 
      @discount_product_list << {item['item_code'] => item['min_vol']} 
    end
    return @discount_product_list 
  end

  def set_discounted_products_prices_list
    @discounted_product_price_list = []
    @data_hash['quantitative_rule']['items'].each do |item| 
      @discounted_product_price_list << {item['item_code'] => item['reduced_price']}
    end
    return @discounted_product_price_list
  end
end


