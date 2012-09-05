class MessagesController < ApplicationController
  before_filter :require_user

  def index
    @messages = Message.limit(100)
    render :json => @messages
  end

  def create
    message = Message.new(params)
    message.name = current_user
    message.save!
    head :ok
  end

  def update
    message = Message.find(params[:id])
    message.name = current_user
    message.update_attributes!(params)
    head :ok
  end
end
