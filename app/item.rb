class Item
  attr_accessor :name, :price

  @@items = Array.new()

  def initialize(name,price)
    @name = name
    @price = price
  end

  def self.add_item(item)
    @@items << item
  end

  def self.get_item_from_name(name)
    return @@items.detect {|item| item.name == name}
  end

end
