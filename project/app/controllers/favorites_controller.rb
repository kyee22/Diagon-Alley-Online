class FavoritesController < ApplicationController
  before_action :authenticate_user!  # 确保用户已登录

  def index
    # 获取当前用户的所有收藏夹产品
    @favorite_products = current_user.favorite_products
  end

  def create
    @product = Product.find(params[:product_id])
    current_user.favorite_products << @product

    # 重定向回用户原来的页面（即 referer），并显示成功通知
    redirect_to request.referer, notice: '已将产品添加到收藏夹'
  end

  def destroy
    @product = Product.find(params[:product_id])
    current_user.favorite_products.delete(@product)
    
    # 重定向回用户原来的页面（即 referer），并显示成功通知
    redirect_to request.referer, notice: '已从收藏夹移除产品'
  end
end
