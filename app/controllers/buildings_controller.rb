class BuildingsController < ApplicationController
  before_action :set_up_building, only: [:show, :edit, :update, :destroy, :search, :map]
  before_action :set_up_form, only: [:new, :create, :edit, :update]
  # 一覧画面に対するアクション
  def index
    @buildings = Building.where(user_id: current_user.id).order(:id).paginate(page: params[:page], per_page: 4)
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
      flash[:success] = "新規登録しました"
      redirect_to buildings_path
    else
      flash.now[:alert] = "登録に失敗しました"
      render :new
    end
  end

  # 建物情報編集アクション
  def edit
  end

  # 建物情報詳細アクション
  def show
    @equipments = Equipment.pluck(:item)
  end
  
  # 建物情報更新アクション
  def update
    if @building.update(building_params)
      if @building.entirety_floor != building_params[:information_by_floors_attributes].to_h.values.map { |h| h["_destroy"] }.count("false")
        flash.now[:alert] = "階数と階情報の数は一致させてください"
        render :edit
      elsif @building.information_by_floors.last[:floor_number] != building_params[:information_by_floors_attributes].to_h.values.map { |h| h["_destroy"] }.count("false")
        flash.now[:alert] = "階数と階情報の最後に選択した階数は一致させてください"
        render :edit
      elsif ["1", "2", "3"].include?(@building.basement_floor) && @building.basement_floor.to_i != building_params[:information_by_basement_floors_attributes].to_h.values.map { |h| h["_destroy"] }.count("false")
        flash.now[:alert] = "地階と階情報の数は一致させてください"
        render :edit
      elsif @building.basement_floor == "なし" && (building_params[:information_by_basement_floors_attributes].to_h.values.map { |h| h["_destroy"] }.include?("false"))
        flash.now[:alert] = "地階で「なし」を選択した場合は、階情報を削除してください。"
        render :edit
      elsif @building.information_by_basement_floors.last[:floor_number].to_i != building_params[:information_by_basement_floors_attributes].to_h.values.map { |h| h["_destroy"] }.count("false")
        flash.now[:alert] = "地階と階情報の最後に選択した階数は一致させてください"
        render :edit
      else
        flash[:success] = "更新しました"
        redirect_to building_path
      end
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  # 削除するためのアクション
  def destroy
    @building.delete
    flash[:success] = "削除しました"
    redirect_to buildings_path
  end

  private
  # 共通化(建物情報取得)
  def set_up_building
    @building = Building.find(params[:id])
    @information_by_floors = @building.information_by_floors
  end

  # 共通化(formのセレクト部分)
  def set_up_form
    @entirety_useges = EntiretyUsege.order(:id)
    @entirety_floors = 20.times.map { |n| ["#{n+1}階", n+1] }
    @entirety_basement_floors = 3.times.map { |n| ["B#{n+1}階", n+1] } << "なし"
    @windowlesses = Windowless.order(:id)
    @information_by_floor_errors = [
      :"information_by_floors.floor_number",
      :"information_by_floors.entirety_usege_id",
      :"information_by_floors.floor_area",
      :"information_by_floors.floor_capacity",
      :"information_by_floors.windowless_id"
    ]
    @information_by_basement_floor_errors = [
      :"information_by_basement_floors.floor_number",
      :"information_by_basement_floors.entirety_usege_id",
      :"information_by_basement_floors.floor_area",
      :"information_by_basement_floors.floor_capacity"
    ]
  end

  # strong parameter
  def building_params
    params.require(:building).permit(:user_id, :id, :name, :address, :entirety_usege_id, :entirety_floor, :basement_floor, :total_area, :total_capacity, :fire_use, information_by_floors_attributes:[:id, :building_id, :floor_number, :entirety_usege_id, :floor_area, :floor_capacity, :windowless_id, :_destroy], information_by_basement_floors_attributes:[:id, :building_id, :floor_number, :entirety_usege_id, :floor_area, :floor_capacity, :_destroy])
  end
end