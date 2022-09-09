class RoomsController < ApplicationController
  before_action :index

  def index
    @projects = Project.all
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
    @task = Task.new
    @tasks = @room.tasks
    @todo = @tasks.where(status: "À faire")
    @inprogress = @tasks.where(status: "En cours")
    @completed = @tasks.where(status: "Faite")
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
      @room.photos = params["room"][room.to_sym]["photos"]
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
    @project = @room.project
    if @room.update(room_params)
      flash[:notice] = "Votre pièce a été mise à jour"
    else
      flash[:alert] = "Erreur ! Votre pièce n'a pas pu etre mise à jour"
    end
    redirect_to project_room_path(@project, @room)
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    render json: { element_id: @room.id, dom_id: "room_#{@room.id}" }
  end

  private

  def room_params
    params.require(:room).permit(:room_type, :name)
  end
end
