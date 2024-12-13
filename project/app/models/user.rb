class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates_inclusion_of :role, in: ['user', 'admin']

  # 默认角色
  after_initialize :set_default_role, if: :new_record?

  has_many :delivery_addresses, dependent: :destroy

  private

  def set_default_role
    self.role ||= 'user'
  end
end
