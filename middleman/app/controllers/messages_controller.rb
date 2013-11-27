class MessagesController < ApplicationController

  respond_to :json

  def index
    @messages = Message.last(10)
  end

  def create
    @message = Message.new(params[:message])
    @message.save
    respond_with(@message)
  end

end
