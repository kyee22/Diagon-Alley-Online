class Type < ApplicationRecord
  # 确保名称存在且唯一
  validates :name, presence: true

  # 确保稀有度是整数且范围在 1 到 10 之间
  validates :rarity, presence: true, numericality: { only_integer: true, greater_than: 0, less_than_or_equal_to: 10 }

  has_many :products
end
