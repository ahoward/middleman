class MessagesController < ApplicationController

  respond_to :json

  def index
    @messages = Message.last(10)
  end

  def create
    peer = Peer.find_by_email(params[:email])
    peer ||= Peer.create(:email => params[:email])
    @message = Message.new(params[:message])
    @message.peer = peer
    @message.save
    respond_with(@message)
  end

end
