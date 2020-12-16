class DiscountPriceCalculator
  def initialize(promotion_rules)
    @promotion_rules = promotion_rules
  end

  def total_amout_after_discounts(basket)
    partial_price = value_after_quantitive_discounts(basket)
    return value_after_qualitative_discounts(partial_price).round(2)
  end

  private 

  def value_after_quantitive_discounts(basket)
    discounted_value = 0
     basket.get_items.each do |item|
       quantity_in_basket = basket.get_items.count { |n| n.code == item.code }
       new_value = (@promotion_rules.get_item_discounted_price(item, quantity_in_basket)).to_f
       discounted_value += new_value
     end
     return discounted_value.to_f
  end

  def value_after_qualitative_discounts(basket_value)
    discount_rate = @promotion_rules.get_basket_discount(basket_value)
    discount_amount = basket_value * (discount_rate/100)
    return (basket_value - discount_amount)
  end
end
