require 'user'
class ApplicationController < ActionController::Base
  protect_from_forgery

  protected

  def current_user
    User.load(cookies.signed[:current_user])
  end

  def require_user
    if params[:token]
      deny unless Settings.token == params[:token]
    else
      deny unless current_user
    end
  end

  def deny
    respond_to do |format|
      format.html { redirect_to "/authorize", :error => "You must be logged in to access this page" }
      format.all { head(:unauthorized) }
    end
    return false
  end

  helper_method :current_user
end
