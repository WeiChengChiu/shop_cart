class OrdersController < ApplicationController
  def create
    @order = Order.new(order_params)

    @cart.items.each do |item|
      @order.order_items.build(product_id: item.product.id, quantity: item.quantity)
    end

    if @order.save
      # 1.購物車清空
      session["my_cart_session"] = nil

      # 2.轉往智付寶
      redirect_to root_path
    else
      render "carts/chekout"
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :tel, :adress)
  end
end
