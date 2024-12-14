class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_address, optional: false # 确保收货地址是必须的

  has_many :order_items, dependent: :destroy

  enum status: { pending: 0, paid: 1, shipped: 2, delivered: 3, cancelled: 4 }

  validates :total_price, numericality: { greater_than_or_equal_toa: 0 }
  validates :delivery_address_id, presence: true

  # 状态更新时记录时间
  def update_status(new_status)
    self.status = new_status
    self.updated_at = Time.current
    save!
  end
end
