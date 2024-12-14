class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!   # 确保用户已登录
  before_action :ensure_admin         # 确保是管理员才能访问

  def index
    @orders = Order.includes(:user, :order_items).all
  end

  def ship
    order = Order.find(params[:id])
    order.update_status(:shipped)
    redirect_to admin_orders_path, notice: '订单已发货！'
  end

  def cancel
    order = Order.find(params[:id])
    order.update_status(:cancelled)
    redirect_to admin_orders_path, notice: '订单已删除！'
  end
end
