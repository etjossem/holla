class AuthorizeController < ApplicationController
  def create
    oauth = request.env["omniauth.auth"]
    cookies.permanent.signed[:current_user] = User.new(oauth).dump

    redirect_to "/"
  end

  def failure
    raise "OAuth failure - #{params[:message]}"
  end

  def destroy
    cookies.signed[:current_user] = nil
    redirect_to "/"
  end
end
