class HomesController < ApplicationController
  def index
  end

  def about
  end

  def introduction
    @equipments = Equipment.order(:id)
  end

  def search
  end
end
