class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @task = Task.new
    @tasks = @room.tasks
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
      @room = Room.new(name: room, room_type: room)
      @room.project = @project
      @room.photos = params["room"]["photos"]
      @room.save!
    end
    redirect_to project_path(@project)
  end

  def edit
    @room = Room.find(params[:id])
  end

  def delete_photo
    @room = Room.find(params[:room_id])
    @room.photos.find(params[:photo]).purge
    redirect_to edit_room_path(@room.project, @room)
  end

  def update
    @room = Room.find(params[:id])
    authorize @room
    if @room.update(room_params)
      flash[:notice] = "Votre pièce a été mise à jour"
    else
      flash[:alert] = "Erreur ! Votre pièce n'a pas pu etre mise à jour"
    end
    redirect_to room_path(@room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    redirect_to project_path(@room.project), status: :see_other
  end

  private

  def room_params
    params.require(:room).permit(:room_type, :name)
  end
end
