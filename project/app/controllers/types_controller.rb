class TypesController < ApplicationController
  before_action :set_type, only: %i[ show edit update destroy ]
  before_action :authenticate_user!   # 确保用户已登录
  before_action :ensure_admin         # 确保是管理员才能访问

  # GET /types or /types.json
  def index
    @types = Type.all
  end

  # GET /types/1 or /types/1.json
  def show
  end

  # GET /types/new
  def new
    @type = Type.new
  end

  # GET /types/1/edit
  def edit
  end

  # POST /types or /types.json
  def create
    @type = Type.new(type_params)

    respond_to do |format|
      if @type.save
        format.html { redirect_to @type, notice: "Type was successfully created." }
        format.json { render :show, status: :created, location: @type }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /types/1 or /types/1.json
  def update
    respond_to do |format|
      if @type.update(type_params)
        format.html { redirect_to @type, notice: "Type was successfully updated." }
        format.json { render :show, status: :ok, location: @type }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /types/1 or /types/1.json
  def destroy
    # @type.destroy!

    # respond_to do |format|
    #   format.html { redirect_to types_path, status: :see_other, notice: "Type was successfully destroyed." }
    #   format.json { head :no_content }
    # end

    respond_to do |format|
      if @type.destroy
        format.html { redirect_to types_path, notice: "类型已成功删除。" }
        format.json { render :show, status: :ok, location: @type }
      else
        format.html { redirect_to types_path, notice: @type.errors }
        format.json { render json: @type.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_type
      @type = Type.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def type_params
      params.require(:type).permit(:name, :rarity)
    end
end
