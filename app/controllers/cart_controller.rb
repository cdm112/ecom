class CartController < ApplicationController
  def add_to_cart
  	line_item = LineItem.create(product_id: params[:product_id], quantity: params[:quantity])
  	line_item.update(line_item_total: (line_item.quantity * line_item.product.price))
  	redirect_back(fallback_location: root_path)
  end

  def view_order
  	@line_items = LineItem.all
  end

  def checkout
  end

  def cart_delete
  	@line_item = LineItem.find(params[:line_item_id])
    @line_item.destroy
  	redirect_to view_order_path
  end

  def cart_edit
    line_item = LineItem.find(params[:line_item_id])
    line_item.quantity = params[:quantity]
    line_item.save
    line_item.update(line_item_total: (line_item.quantity * line_item.product.price))
    redirect_back(fallback_location: view_order_path)
  end

end
