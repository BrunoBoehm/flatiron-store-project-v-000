class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

  def total
    total = 0

    line_items.each do |line|
      total += (line.item.price * line.quantity)
    end

    total
  end

  def add_item(item_id)
  	# Instead of searching through LineItems we use cart.line_items
  	# because we first check if the item is already in the cart (and then update quantity)
    line_item = line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
      # quantity will have to be saved
    else
    # The item is not in the cart, we build the line_item from scratch	
      line_item = line_items.build(item_id: item_id)
    end
    line_item
  end

  def checkout
  	# Checking out a cart means
  	# 1. removing purchased items from available inventory
  	# 2. emptying current_cart (nil + save)
    line_items.each do |line|
      line.item.inventory -= line.quantity
      line.item.save
    end
    user.current_cart = nil
    user.save
  end
end