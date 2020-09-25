class RoomMessagesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @room_message = @room.room_messages.build(room_message_params)
    @room_message.user = current_user
    @room_message.save
    ActionCable.server.broadcast 'message', body: @room_message.as_json(include: :user)
  end

  private

  def room_message_params
    params.require(:room_message).permit(:message)
  end
end
