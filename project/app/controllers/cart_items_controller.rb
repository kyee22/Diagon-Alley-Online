class CartItemsController < ApplicationController
  before_action :authenticate_user!

  # 创建购物车项：添加产品到购物车
  def create
    @product = Product.find(params[:product_id])
    @cart_item = current_user.cart_items.find_or_initialize_by(product: @product)

    if @cart_item.new_record?
      @cart_item.quantity = 1
      @cart_item.added_at = Time.current
    else
      @cart_item.quantity += 1
    end

    respond_to do |format|
      if @cart_item.save
        format.html { redirect_to cart_items_path, notice: "已将产品加入购物车！" }
        format.json { render :show, status: :created, location: @cart_item }
      else
        format.html { redirect_to products_path, notice: "加入失败！", status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # 删除购物车项：从购物车中移除产品
  def destroy
    @cart_item = current_user.cart_items.find(params[:id])
    @cart_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_items_path, status: :see_other, notice: "产品已从购物车移除！" }
      format.json { head :no_content }
    end
  end

  # 更新购物车项：修改产品数量
  def update
    @cart_item = current_user.cart_items.find(params[:id])

    respond_to do |format|
      if @cart_item.update(cart_item_params)
        format.html { redirect_to cart_items_path, notice: "购物车已更新！" }
        format.json { render :show, status: :ok, location: @cart_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart_item.errors, status: :unprocessable_entity }
      end
    end

  end

  # 显示用户购物车：列出所有购物车项
  def index
    @cart_items = current_user.cart_items.includes(:product)
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end
end
