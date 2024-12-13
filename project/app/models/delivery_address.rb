class DeliveryAddress < ApplicationRecord
  belongs_to :user

  validates :receiver_name, presence: true
  validates :phone, :postal_code, :address, presence: true
  # 中国的电话格式：
  #   格式：1XXXXXXXXXX（以 1 开头，后跟 10 个数字）
  #   示例：13812345678
  #   验证：电话号应为 11 位数字，且首位必须为 1。
  validates :phone, format: { with: /\A1\d{10}\z/, message: "电话格式无效" }
  # 中国的邮编格式：
  #   格式：XXXXX（5 位数字）
  #   示例：100000（北京的邮政编码）
  #   验证：仅由 5 位数字组成。
  validates :postal_code, format: { with: /\A\d{5}\z/, message: "邮政编码格式无效" }
end
