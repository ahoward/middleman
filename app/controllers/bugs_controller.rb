class BugsController < ApplicationController

  respond_to :html, :text

  def index
    @bugs = Bug.all
  end

  def show
    @bug = Bug.find(params[:id])
    respond_with(@bug)
  end

end
