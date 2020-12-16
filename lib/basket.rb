class Basket
  def initialize
    @items = []
    @value = 0
  end

  def get_items
    @items
  end

  def add_item(item)
    @items << item
  end

  def print_basket
    printout = "Basket: "
    @items.each do |item|
      printout << "#{item.code}, "
    end
    return printout[0..-3]
  end
end
