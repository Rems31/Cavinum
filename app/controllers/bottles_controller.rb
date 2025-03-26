class BottlesController < ApplicationController
  before_action :set_bottle, only: %i[update destroy edit show]
  def index
    @bottles = Bottle.all
    sql_subquery = "name ILIKE :query OR appellation ILIKE :query OR variety ILIKE :query"
    @bottles = @bottles.where(sql_subquery, query: "%#{params[:query]}%") if params[:query].present?
  end

  def show
    @slot = @bottle.slot
  end

  def new
    @bottle = Bottle.new
    @bottle.slot = Slot.find(params[:slot].to_i) if params[:slot].present?
    @available_slots = current_user.cellar.slots.includes(:bottle).select { |slot| slot.bottle.nil? }
    @all_slots = current_user.cellar.slots
  end

  def create
    @bottle = Bottle.new(bottle_params)
    @all_slots = current_user.cellar.slots
    @available_slots = current_user.cellar.slots.includes(:bottle).select { |slot| slot.bottle.nil? }
    if @bottle.save
      redirect_to root_path, notice: "Bouteille ajoutée avec succès."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @bottle.slot = Slot.find(params[:slot].to_i) if params[:slot].present?
    @all_slots = current_user.cellar.slots
    @available_slots = current_user.cellar.slots.includes(:bottle).select { |slot| slot.bottle.nil? }
  end

  def update
    @available_slots = current_user.cellar.slots.includes(:bottle).select { |slot| slot.bottle.nil? }
    @all_slots = current_user.cellar.slots
    if @bottle.update(bottle_params)
      redirect_to bottle_path(@bottle), notice: "Bouteille modifiée avec succès."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @bottle.destroy
    redirect_to root_path, status: :see_other, notice: "Bouteille retirée avec succès."
  end

  private

  def set_bottle
    @bottle = Bottle.find(params[:id])
  end

  def bottle_params
    params.require(:bottle).permit(:name, :appellation, :kind, :vintage, :area, :variety, :photo, :notes, :slot_id)
  end
end
