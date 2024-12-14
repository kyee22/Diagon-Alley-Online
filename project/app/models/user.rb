class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_inclusion_of :role, in: ['user', 'admin']

  # 默认角色
  after_initialize :set_default_role, if: :new_record?

  has_many :delivery_addresses, dependent: :destroy

  #################### 用户 --> 收藏夹 <-- 产品 ####################
  # 用户和收藏夹是多对多关系
  has_many :favorites
  has_many :favorite_products, through: :favorites, source: :product

  #################### 用户 --> 购物车 <-- 产品 ####################
  has_many :cart_items, dependent: :destroy
  has_many :products, through: :cart_items

  #################### 用户 --> 订单 <-- 产品 ####################
  has_many :orders, dependent: :destroy


  private

  def set_default_role
    self.role ||= 'user'
  end
end
