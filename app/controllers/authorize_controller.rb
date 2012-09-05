class AuthorizeController < ApplicationController
  def create
    info = request.env["omniauth.auth"]["user_info"]
    cookies.permanent.signed[:handle] = info['nickname']
    cookies[:name]   = info['name']
    cookies[:image]  = info['image']

    redirect_to "/"
  end

  def failure
    raise "OAuth failure - #{params[:message]}"
  end

  def destroy
    cookies.delete(:handle)
  end
end
