class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:success] = "Room Successfully Created"
      redirect_to rooms_path
    else
      flash.now[:error] = "Room could not be created"
      render :new
    end
  end

  def show
    @room = Room.find(params[:id])
    @rooms = Room.all
    @room_messages = @room.room_messages.includes(:user)
    @room_message = RoomMessage.new
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:success] = "Room successfully updated"
      redirect_to rooms_path
    else
      flash.now[:error] = "Room could not be updated"
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      flash[:success] = "The room was destroyed"
      redirect_to rooms_path
    else
      flash.now[:error] = "The room could not be destroyed"
      redirect_to rooms_path
    end
  end

  private

  def room_params
    params.require(:room).permit(:name)
  end
end
