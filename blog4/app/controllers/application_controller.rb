class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  layout :choose_layout

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:current_userid]) if session[:current_userid]
  end

  private
    def choose_layout
      if controller_name == "welcome"
        "home"
      else
        "application"
      end
    end

end
