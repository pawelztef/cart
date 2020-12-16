class PromotionRules
  def initialize(min_value, basket_discount, discount_product_list, discounted_products_price_list)
    @min_value = min_value
    @basket_discount = basket_discount
    @discount_product_list = discount_product_list
    @discounted_products_price_list = discounted_products_price_list
  end

  def get_basket_discount(basket_value)
    if @min_value.to_f <= basket_value.to_f
      return @basket_discount
    else
      return 0
    end
  end

  def get_item_discounted_price(item, qty)
    if quantitative_rule_applied?(item.code.to_s) && min_quantity_reached?(item.code.to_s, qty)
        return @discounted_products_price_list[0][item.code]
    else
      return item.price.to_f
    end
  end

  def quantitative_rule_applied?(item_code) 
    @discount_product_list[0].keys.include?(item_code)
  end

  def min_quantity_reached?(item_code, quantity)
    code = item_code.to_s
    quantity >= @discount_product_list[0][code].to_i 
  end
end
