class RoomsController < ApplicationController
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])
  end

    def new
      @room = Room.new
    end

    def create
      @room = Room.new(room_params)
      @room.project_id = params(:project_id)
      if @room.save
        flash[:notice] = "Votre pièce a été créée !"
        redirect_to bike_path(@bike)
      else
        flash[:alert] = "Erreur ! Votre pièce n'a pas été créée"
        render :new, status: :unprocessable_entity
      end
    end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      flash[:notice] = "Votre pièce a été modifiée !"
    else
      flash[:alert] = "Erreur ! Votre pièce n'a pas été modifiée"
    end
    redirect_to #Ou est ce que je redirect?
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy
    flash[:notice] = "Votre pièce a été détruite"
    redirect_to project_path(@room), status: :see_other #Est ce la bonne redicretion?
  end

  private

  def room_params
    params.require(:room).permit(:room_type, :photos)
  end
end
