class Order < ApplicationRecord
  has_many :order_items

  validates :address, presence: true
  # validates_of address

  # instance methods
  def serial_generator
    "OD#{id.to_s.rjust(10, "0")}"
  end
end
