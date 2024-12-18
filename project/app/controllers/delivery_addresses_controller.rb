class DeliveryAddressesController < ApplicationController
  before_action :authenticate_user!

  def index
    @delivery_addresses = current_user.delivery_addresses
  end

  # 新建收货地址
  def new
    @delivery_address = current_user.delivery_addresses.build
  end

  # 创建收货地址
  def create
    @delivery_address = current_user.delivery_addresses.build(delivery_address_params)
    respond_to do |format|
      if @delivery_address.save
        format.html { redirect_to delivery_addresses_path, notice: "送货地址添加成功！" }
        format.json { render :show, status: :created, location: @delivery_address }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # 编辑送货地址
  def edit
    @delivery_address = current_user.delivery_addresses.find(params[:id])
  end

  # 更新送货地址
  def update
    @delivery_address = current_user.delivery_addresses.find(params[:id])
    respond_to do |format|
      if @delivery_address.update(delivery_address_params)
        format.html { redirect_to delivery_addresses_path, notice: "送货地址更新成功！" }
        format.json { render :show, status: :ok, location: @delivery_address }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end

  # 删除送货地址
  def destroy
    # @delivery_address = current_user.delivery_addresses.find(params[:id])
    # @delivery_address.destroy
    #
    # respond_to do |format|
    #   format.html { redirect_to delivery_addresses_path, status: :see_other, notice: "送货地址删除成功" }
    #   format.json { head :no_content }
    # end
    @delivery_address = current_user.delivery_addresses.find(params[:id])

    respond_to do |format|
      if @delivery_address.destroy
        format.html { redirect_to delivery_addresses_path, notice: "送货地址删除成功" }
        format.json { head :no_content }
      else
        format.html { redirect_to delivery_addresses_path, notice: @delivery_address.errors.full_messages.to_sentence }
        format.json { render json: @delivery_address.errors, status: :unprocessable_entity }
      end
    end
  end


  private

  def delivery_address_params
    params.require(:delivery_address).permit(:receiver_name, :phone, :postal_code, :address)
  end

end
