class RoomsController < ApplicationController
  before_action :set_room, only: [:show]

  def index
    @rooms = Room.all
  end

  def new
    @room = Room.new
  end

  def create
    Room.create(room_params)
  end

  def destroy
    room = Room.find(params[:id])
    room.destroy
  end

  def show
  end

  private
  def room_params
    params.require(:room).permit(:name, :image, :text)
  end

  def set_room
    @room = Room.find(params[:id])
  end

end
