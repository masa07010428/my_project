class HomesController < ApplicationController
  def index
  end

  def about
  end

  def introduce
    @equipments = Equipment.order(:id)
  end

  def search
  end
end
