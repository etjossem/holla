class ChannelsController < ApplicationController
  before_filter :require_user, :except => :index
  before_filter :find_channel, :only => [:update, :destroy]

  def index
    @channels = Channel.all
    render :json => @channels
  end

  def create
    @channel = Channel.new(params)
    @channel.owner = current_user.cid
    @channel.save!
    head :ok
  end

  def update
    @channel.update_attributes!(params)
    head :ok
  end

  def destroy
    if current_user.cid == @channel.owner
      @channel.destroy
      head :ok
    else
      head :method_not_allowed
    end
  end

  private

  def find_channel
    @channel = Channel.find(params[:id])
  end
end
