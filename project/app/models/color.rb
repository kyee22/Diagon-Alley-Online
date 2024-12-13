class Color < ApplicationRecord
  # 确保名称存在且唯一
  validates :name, presence: true, uniqueness: true

  # 确保代码存在且格式正确
  validates :code, presence: true, format: { with: /\A#[0-9A-Fa-f]{6}\z/, message: "must be a valid hex color code" }

  # 确保透明度在 0 到 1 之间
  validates :opacity, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 1 }

  has_many :products
end
