class User < ApplicationRecord
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :followships
  has_many :reverse_followships, class_name: "Followship", foreign_key: "following_user_id"
  has_many :followings, through: :followships
  has_many :followers, through: :reverse_followships
end