class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[update destroy edit show]
  def index
    @bottles = Bottle.all
  end

  def show; end

  def new
    @bottle = Bottle.new
  end

  def create
    @bottle = Bottle.new(bottle_params)
    @bottle.user = current_user

    if @bottle.save
      redirect_to bottles_path(@bottle), notice: "Bouteille créee avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @bottle.update(bottle_params)
      redirect_to bottle_path(@bottle), notice: "Bouteille modifiée avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bottle.destroy
    redirect_to bottles_path, status: :see_other, notice: "Bouteille supprimée avec succès."
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end

  def bottle_params
    params.require(:bottle).permit(:name, :appellation, :type, :vintage, :area, :variety, :photo, :notes)
  end
end
