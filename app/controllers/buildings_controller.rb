class BuildingsController < ApplicationController
  before_action :set_up_building, only: [:edit, :update, :destroy]
  before_action :set_up_form, only: [:new, :edit]
  # 一覧画面に対するアクション
  def index
    @buildings = Building.where(user_id: current_user.id).order(:id)
  end

  # 新規作成画面に対するアクション
  def new
    @building = Building.new
  end

  # 新規建物登録アクション
  def create
    Building.create(building_params)
  end

  # 建物情報編集アクション
  def edit
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
    # 「TODO:application_helper.rbに消防用設備等の必要不要のロジックを記載するために建物情報を受け取る」
  end

  private
  # 共通化(建物情報取得)
  def set_up_building
    @building = Building.find(params[:id])
  end

  # 共通化(formのセレクト部分)
  def set_up_form
    @entirety_useges = EntiretyUsege.order(:id)
    @entirety_floors = 20.times.map { |n| ["#{n+1}階",n+1] }
  end

  # stronge parameter
  def building_params
    params.require(:building).permit(:user_id, :name, :address, :entirety_usege_id, :entirety_floor, :basement_floor, :total_area, :total_capacity, :windowless_floor, :fire_use)
  end
end