class BuildingsController < ApplicationController
  # 一覧画面に対するアクション
  def index
    @buildings = Building.where(user_id: current_user.id)

  end

  # 新規作成画面に対するアクション
  def new
    @building = Building.new
    @entirety_useges = EntiretyUsege.all
    @entirety_floors = 20.times.map { |n| ["#{n+1}階",n+1] }

  end

  # 新規建物登録アクション
  def create
    Building.create(building_params)
  end

  # 建物情報編集アクション
  def edit
    @building = Building.find(params[:id])
    @entirety_useges = EntiretyUsege.all
    @entirety_floors = 20.times.map { |n| ["#{n+1}階",n+1] }

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

  # 必要な消防用設備等について確認する
  def search
    # ここに消防用設備等の必要不要のロジックを記載する
  end



  private
  def building_params
    params.require(:building).permit(:user_id, :name, :address, :entirety_usege_id, :entirety_floor, :basement_floor, :total_area, :total_capacity, :windowless_floor, :fire_use)
  end
end