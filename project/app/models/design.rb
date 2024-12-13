class Design < ApplicationRecord
  # 确保名称存在且唯一
  validates :name, presence: true, uniqueness: true

  has_many :products
end
