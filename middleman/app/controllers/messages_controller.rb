class MessagesController < ApplicationController

  respond_to :json

  def index
    @messages = Message.last(10)
  end

  def create
    bug = Bug.from_string(params[:bug])
    peer = Peer.find_by_email(params[:email])
    peer ||= Peer.create(:email => params[:email])
    message = Message.create(:text => params[:text], :peer => peer, :bug => bug)
    respond_with(message)
  end

end
