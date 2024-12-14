class DesignsController < ApplicationController
  before_action :set_design, only: %i[ show edit update destroy ]
  before_action :authenticate_user!   # 确保用户已登录
  before_action :ensure_admin         # 确保是管理员才能访问

  # GET /designs or /designs.json
  def index
    @designs = Design.all
  end

  # GET /designs/1 or /designs/1.json
  def show
  end

  # GET /designs/new
  def new
    @design = Design.new
  end

  # GET /designs/1/edit
  def edit
  end

  # POST /designs or /designs.json
  def create
    @design = Design.new(design_params)

    respond_to do |format|
      if @design.save
        format.html { redirect_to @design, notice: "Design was successfully created." }
        format.json { render :show, status: :created, location: @design }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /designs/1 or /designs/1.json
  def update
    respond_to do |format|
      if @design.update(design_params)
        format.html { redirect_to @design, notice: "Design was successfully updated." }
        format.json { render :show, status: :ok, location: @design }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /designs/1 or /designs/1.json
  def destroy
    # @design.destroy!
    #
    # respond_to do |format|
    #   format.html { redirect_to designs_path, status: :see_other, notice: "Design was successfully destroyed." }
    #   format.json { head :no_content }
    # end
    respond_to do |format|
      if @design.destroy
        format.html { redirect_to designs_path, notice: "款式已成功删除。" }
        format.json { render :show, status: :ok, location: @design }
      else
        format.html { redirect_to designs_path, notice: @design.errors }
        format.json { render json: @design.errors, status: :unprocessable_entity }
      end
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_design
      @design = Design.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def design_params
      params.require(:design).permit(:name)
    end
end
