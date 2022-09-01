class TasksController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @task = Task.new(task_params)
    @task.room = @room
    @task.status = "A faire"
    @task.save
    redirect_to project_room_path(@room.project, @room)
  end

  def move
    @task = Task.find(params[:id])
    @task.insert_at(params[:position].to_i)
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
    params.require(:task).permit(:start_date, :end_date, :name, :position, :description, :status)
  end
end
