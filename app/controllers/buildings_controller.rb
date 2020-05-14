class BuildingsController < ApplicationController
  before_action :set_up_building, only: [:edit, :update, :destroy, :search]
  before_action :set_up_form, only: [:new, :create, :edit]
  # 一覧画面に対するアクション
  def index
    @buildings = Building.where(user_id: current_user.id).order(:id)
  end

  # 新規作成画面に対するアクション
  def new
    @building = Building.new
    @information_by_floors = @building.information_by_floors.build
  end

  # 新規建物登録アクション
  def create
    @building = Building.new(building_params)
    if @building.save
      redirect_to buildings_path
    else
      render :new
    end
  end

  # 建物情報編集アクション
  def edit
  end

  # 建物情報詳細アクション
  def show
  end
  
  # 建物情報更新アクション
  def update
    @building.update(building_params)
  end

  # 削除するためのアクション
  def destroy
    @building.delete
  end

  # 必要な消防用設備等について確認する
  def search
    # application_helper.rbに消防用設備等の必要不要のロジックを記載する
    @equipments = Equipment.pluck(:item)
  end
  
  private
  # 共通化(建物情報取得)
  def set_up_building
    @building = Building.find(params[:id])
  end

  # 共通化(formのセレクト部分)
  def set_up_form
    @entirety_useges = EntiretyUsege.order(:id)
    @entirety_floors = 20.times.map { |n| ["#{n+1}階", n+1] }
    @entirety_basement_floors = 3.times.map { |n| ["B#{n+1}階", n+1] } << "なし"
    @windowlesses = Windowless.order(:id)
    @information_by_floor_errors = [
      :"information_by_floors.floor_number",
      :"information_by_floors.floor_usege",
      :"information_by_floors.floor_area",
      :"information_by_floors.floor_capacity",
      :"information_by_floors.windowless_id"]
    @information_by_basement_floor_errors = [
      :"information_by_basement_floors.floor_number",
      :"information_by_basement_floors.floor_usege",
      :"information_by_basement_floors.floor_area",
      :"information_by_basement_floors.floor_capacity"]
  end

  # strong parameter
  def building_params
    params.require(:building).permit(:user_id, :name, :address, :entirety_usege_id, :entirety_floor, :basement_floor, :total_area, :total_capacity, :fire_use, information_by_floors_attributes:[:floor_number, :floor_usege, :floor_area, :floor_capacity, :windowless_id, :_destroy], information_by_basement_floors_attributes:[:floor_number, :floor_usege, :floor_area, :floor_capacity, :_destroy])
  end
end