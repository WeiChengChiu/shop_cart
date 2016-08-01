class Order < ApplicationRecord
  has_many :order_items

  validates :address, presence: true
  # validates_of address

  # instance methods
  def serial_generator
    "OD#{id.to_s.rjust(10, "0")}"
  end

  def amount
    order_items.reduce(0) { |sum, item| sum + item.total_price }
  end
end
