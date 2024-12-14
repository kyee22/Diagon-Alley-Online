class Design < ApplicationRecord
  # 确保名称存在且唯一
  validates :name, presence: true, uniqueness: true

  has_many :products

  # 回调：只有没有关联的产品时才允许删除
  before_destroy :check_products_empty

  private

  def check_products_empty
    if products.exists?
      errors.add(:base, "无法删除，因为此款式仍有关联的产品。")
      throw(:abort) # 阻止删除操作
    end
  end
end
