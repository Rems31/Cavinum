class CellarsController < ApplicationController
  def show
    @cellar = current_user.cellar
    @bottles = current_user.bottles
    sql_subquery = "bottles.name ILIKE :query OR bottles.appellation ILIKE :query OR bottles.variety ILIKE :query"
    @bottles = @bottles.where(sql_subquery, query: "%#{params[:query]}%") if params[:query].present?
  end
end
