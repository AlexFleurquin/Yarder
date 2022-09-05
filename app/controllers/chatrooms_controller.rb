class ChatroomsController < ApplicationController
  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def create
    @chatroom = Chatroom.new
    @chatroom.client = current_user
    @chatroom.professional_id = params[:professional].to_i
    @chatroom.save
    redirect_to chatroom_path(@chatroom)
  end
end
