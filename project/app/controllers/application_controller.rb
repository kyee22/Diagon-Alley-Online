class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  layout :choose_layout

  private

  def choose_layout
    if controller_name == "home"
      "home"
    else
      "application"
    end
  end

  # 确保用户是管理员
  def ensure_admin
    unless current_user && current_user.role == 'admin'
      redirect_to products_path, notice: '权限不足，无法访问该页面！'
    end
  end
end
