class CartItem < ApplicationRecord
  belongs_to :user
  belongs_to :product

  # 确保数量大于0
  validates :quantity, numericality: { greater_than: 0 }

  # 确保每个用户对每个产品只有一个条目
  validates_uniqueness_of :product_id, scope: :user_id

  # 计算总价
  def total_price
    product.price * quantity
  end
end
