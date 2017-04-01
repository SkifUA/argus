class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :admin?

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_user
    redirect_to '/login' unless current_user
  end

  def admin?
    return false unless session[:user_id]
    return false unless Administrator.exists?(user_id: session[:user_id])
    true
  end

  def superadmin?
    return false unless session[:user_id]
    return false unless Administrator.exists?(user_id: session[:user_id], role: Administrator::SUPERADMIN)
    true
  end

  def require_admin
    redirect_to '/login' unless admin?
  end

end
