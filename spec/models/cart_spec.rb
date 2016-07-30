require 'rails_helper'



RSpec.describe Cart, type: :model do
  describe '購物車相關功能' do
    it '可以加到購物車' do
      cart = Cart.new

      cart.add_item(2)
      expect(cart.empty?).to be false
    end

    it '加一樣的商品不會增加 item 數' do
      cart = Cart.new
      5.times do
        cart.add_item(1)
      end

      3.times do
        cart.add_item(2)
      end

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 5
      expect(cart.items.last.quantity).to be 3
    end

    it '可取出正確商品' do
      cart = Cart.new
      p1 = Product.create
      p2 = Product.create
      cart.add_item(p1.id)

      expect(cart.items.first.product).to be_a Product
      expect(cart.items.last.product).to be_a Product
    end

    it 'Cart 計算總價' do
      cart = Cart.new
      p1 = Product.create(price: 50)
      p2 = Product.create(price: 100)

      cart.add_item(p1.id)
      cart.add_item(p2.id)


      expect(cart.total_price).to be 150
    end

    it '序列化' do
      cart = Cart.new

      cart.add_item(2)
      cart.add_item(3)

      expect(cart.serialize).to eq cart_hash
    end

    it '反序列化' do

    end

    private

    def cart_hash
      {
        "items" => [
          {"product_id" => 2, "quantity" => 1},
          {"product_id" => 3, "quantity" => 1}
        ]
      }
    end
  end
end
