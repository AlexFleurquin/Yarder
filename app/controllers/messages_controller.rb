class MessagesController < ApplicationController
  def create
    @chatroom = Chatroom.find(params[:chatroom_id])
    @message = Message.new(message_params)
    @message.chatroom = @chatroom
    @message.user = current_user

    if @message.save!
      render json: json_response
    else
      render "chatrooms/show", status: :unprocessable_entity
    end
  end

  private

  def json_response
    {
      html: render_to_string(partial: "messages/message", locals: { message: @message }, formats: [:html])
    }
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
