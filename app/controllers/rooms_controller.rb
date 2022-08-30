class RoomsController < ApplicationController
  def index
  end

  def show
  end

  def new
    @project = Project.find(params[:project_id])
    @room = Room.new
  end

  def create
    @project = Project.find(params[:project_id])
    list = params["room"]["room_type"]
    clean_list = list[1..list.length - 1]
    clean_list.each do |room|
      @room = Room.new(room_type: room)
      @room.project = @project
      @room.photos = params["room"]["photos"]
      if @room.save
        redirect_to project_path(@project)
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
