class MessagesController < ApplicationController
  before_filter :require_user, :except => [:index]

  def index
    @messages = Message.limit(100)
    render :json => @messages
  end

  def create
    message = Message.create!(params)
    head :ok
  end

  def update
    message = Message.find(params[:id])
    message.name = current_user.nickname
    message.update_attributes!(params)
    head :ok
  end
end
