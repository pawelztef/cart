require_relative 'promotion_rules'
require_relative 'promotion_rules_builder'
require_relative 'item'
require_relative 'checkout'

file = File.read('discount_params.json')
promotion_rules = PromotionRulesBuilder.new(file).build
co = Checkout.new(promotion_rules)

item1 = Item.new("001", "Red Scarf", "9.25")
item2 = Item.new("002", "Silver Cufflinks", "45.00")
item3 = Item.new("003", "Silk Dress", "19.95")

co.scan(item1)
co.scan(item2)
co.scan(item3)
co.total

co = Checkout.new(promotion_rules)
co.scan(item1)
co.scan(item3)
co.scan(item1)
co.total

co = Checkout.new(promotion_rules)
co.scan(item1)
co.scan(item2)
co.scan(item1)
co.scan(item3)
co.total
