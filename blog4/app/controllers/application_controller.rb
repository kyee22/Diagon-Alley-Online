class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  layout :choose_layout

  private
    def choose_layout
      if controller_name == "welcome"
        "home"
      else
        "application"
      end
    end

end
