class MessagesController < ApplicationController

  respond_to :html, :text

  def index
    @messages = Message.order('created_at desc').limit(10)
  end

  def create
    bug = Bug.from_string(params[:bug])
    if bug.message.nil?
      peer = Peer.find_by_email(params[:email])
      peer ||= Peer.create(:email => params[:email])
      @message = Message.create(:text => params[:text], :peer => peer, :bug => bug)
    else
      @message = bug.message
    end
    @has_conflict = params[:email] != @message.peer.email
    respond_with(@message)
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    redirect_to root_path
  end

end
