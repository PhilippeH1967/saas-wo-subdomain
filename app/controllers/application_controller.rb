class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception



  rescue_from CanCan::AccessDenied do |exception| # Gestion des messages des autorisations d'access
    flash[:danger] = "You don't have permission to do this action."
    redirect_to pages_home_path
  end
end
