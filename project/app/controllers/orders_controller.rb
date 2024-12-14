class OrdersController < ApplicationController
  before_action :authenticate_user!   # 确保用户已登录
  before_action :find_order, only: %i[pay confirm_receive cancel]

  def create
    cart_items = current_user.cart_items.includes(:product)
    if cart_items.empty?
      redirect_to cart_items_path, notice: '购物车为空，无法生成订单！'
      return
    end

    # 检查是否选择了有效的收货地址
    if params[:delivery_address_id].blank?
      redirect_to cart_items_path, notice: '请选择收货地址！'
      return
    end

    # 确保选择的收货地址存在且属于当前用户
    delivery_address = current_user.delivery_addresses.find_by(id: params[:delivery_address_id])
    if delivery_address.nil?
      redirect_to cart_items_path, notice: '无效的收货地址！'
      return
    end

    Order.transaction do
      @order = current_user.orders.create!(
        delivery_address_id: params[:delivery_address_id],
        total_price: cart_items.sum { |item| item.total_price },
        status: :pending
      )

      cart_items.each do |item|
        @order.order_items.create!(
          product: item.product,
          quantity: item.quantity,
          price: item.total_price
        )
      end

      cart_items.destroy_all
    end

    redirect_to orders_path, notice: '订单已生成！'
  rescue ActiveRecord::RecordInvalid => e
    redirect_to cart_items_path, alert: "生成订单失败：#{e.message}"
  end

  def index
    @orders = current_user.orders.includes(:order_items)
  end

  def pay
    @order.update_status(:paid)
    redirect_to orders_path, notice: '订单已付款！'
  end

  def confirm_receive
    @order.update_status(:delivered)

    @order.order_items.each do |order_item|
      product = order_item.product
      product.sales += order_item.quantity
      product.save!  # 保存销量更新
    end

    redirect_to orders_path, notice: '订单已确认收货！'
  end

  def cancel
    @order.update_status(:cancelled)
    redirect_to orders_path, notice: '订单已取消！'
  end

  private

  def find_order
    @order = current_user.orders.find(params[:id])
  end
end
