class Admin::AttributesController < ApplicationController
  before_action :authenticate_user!   # 确保用户已登录
  before_action :ensure_admin         # 确保是管理员才能访问

  def index
  end
end
