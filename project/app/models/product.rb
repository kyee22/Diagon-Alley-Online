class Product < ApplicationRecord
  # 确保名称不能为空，并且唯一
  validates :name, presence: true, uniqueness: true

  # 确保价格大于0且为数字
  validates :price, numericality: { greater_than: 0 }

  # 确保销量是整数且大于或等于0
  validates :sales, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  # 确保描述的长度不超过500个字符
  validates :description, length: { maximum: 500 }

  belongs_to :color
  belongs_to :design
  belongs_to :size
  belongs_to :type

  has_one_attached :image, dependent: :destory
end
