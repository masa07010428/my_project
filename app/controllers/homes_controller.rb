class HomesController < ApplicationController
  before_action :authenticate_user!, except: %i[index about introduction]
  def index; end

  def about; end

  def introduction
    @equipments = Equipment.order(:id)
  end
end
