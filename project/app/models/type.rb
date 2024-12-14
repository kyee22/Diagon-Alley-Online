class Type < ApplicationRecord
  # 确保名称存在且唯一
  validates :name, presence: true

  # 确保稀有度是整数且范围在 1 到 10 之间
  validates :rarity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }

  has_many :products

  # 回调：只有没有关联的产品时才允许删除
  before_destroy :check_products_empty

  private

  def check_products_empty
    if products.exists?
      errors.add(:base, "无法删除，因为此类型仍有关联的产品。")
      throw(:abort) # 阻止删除操作
    end
  end
end
