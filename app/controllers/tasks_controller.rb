class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def create
    @room = Room.find(params[:room_id])
    @task = Task.new(task_params)
    @task.room = @room
    @task.status = "À faire"
    @task.save
    redirect_to project_room_path(@room.project, @room)
  end

  def move
    @task = Task.find(params[:id])
    @task.insert_at(params[:position].to_i)
    case params[:status]
    when "done" then @task.status = "Faite"
    when "inProgress" then @task.status = "En cours"
    when "todo" then @task.status = "À faire"
    end
    @task.save!
    head :ok
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to project_room_path(@task.room.project, @task.room)
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to project_room_path(@task.room.project, @task.room), status: :see_other
  end

  private

  def task_params
    params.require(:task).permit(:start_date, :end_date, :name, :position, :description, :status, :user_id, :category)
  end
end
