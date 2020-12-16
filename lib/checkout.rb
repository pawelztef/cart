require_relative 'promotion_rules'
require_relative 'basket'
require_relative 'item'
require_relative 'discount_price_calculator'

class Checkout
  def initialize(promotion_rules)
    @basket = Basket.new
    @discount_calculator = DiscountPriceCalculator.new(promotion_rules)
    @total_amount = 0
  end

  def scan(item)
    @basket.add_item(item)
  end

  def total
    checkout
    purchase_summary
  end

  def checkout
    @total_amount = @discount_calculator.total_amout_after_discounts(@basket)
  end

  def purchase_summary
    basket = @basket.print_basket
    print("#{basket}\nTotal price expected: £#{@total_amount}\n")
  end


end
