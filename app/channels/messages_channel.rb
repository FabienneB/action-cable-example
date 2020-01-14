# Def of a channel to inherit from the ApplicationCable::Channel 
class MessagesChannel < ApplicationCable::Channel
  # Subscrib & stream messages that are broadcast to the channel.
  def subscribed
    stream_from 'messages'
  end
end  