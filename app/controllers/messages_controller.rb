class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    if message.save
      # messages: name of channel to which we are broadcasting
      # message and user: content sent through the channel as JSON
      ActionCable.server.broadcast 'messages',
        message: message.content,
        user: message.user.username
      head :ok
    end
    message.save
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_id)
  end
end

