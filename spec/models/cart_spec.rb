require 'rails_helper'

class Cart

  def initialize
    @items = []
  end

  def add_item(product)
    @items << product
  end

  def empty?
    @items.empty?
  end

end

RSpec.describe Cart, type: :model do
  describe '購物車相關功能' do
    it '可以加到購物車' do
      cart = Cart.new
      cart.add_item(2)

      expect(cart.empty?).to be false
    end
  end
end
