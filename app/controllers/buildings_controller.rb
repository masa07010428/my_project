class BuildingsController < ApplicationController
  # 一覧画面に対するアクション
  def index
    @buildings = Building.all
  end

  # 新規作成画面に対するアクション
  def new
    @building = Building.new
    @entirety_useges = EntiretyUsege.all
  end

  # 新規建物登録アクション
  def create
    Building.create(building_params)
  end

  # 建物情報編集アクション
  def edit
    @building = Building.find(params[:id])
  end

  # 建物情報更新アクション
  def update
    building = Building.find(params[:id])
    building.update(building_params)
  end

  # 削除するためのアクション
  def destroy
    building = Building.find(params[:id])
    building.delete
  end

  private
  def building_params
    params.require(:building).permit(:user_id, :name, :address, :entirety_usege, :entirety_floor, :basement_floor, :total_area, :total_capacity, :windowless_floor, :fire_use)
  end
end