class LineItemsController < ApplicationController

  def create
  	# we're building the cart for the current user
    user = current_user

    # creates current_cart if not exists
    user.create_current_cart

    # we build the line_item from the current_user current_cart 
    # through a custom builder (on the Cart model) using the item id
    line_item = user.current_cart.add_item(params[:item_id])
    if line_item.save
      redirect_to cart_path(user.current_cart), notice: "Added #{line_item.item.title}"
    else
      redirect_to store_path, alert: "Couldn't add #{line_item.item.title}"
    end
  end

end