class HomesController < ApplicationController
  def index
  end

  def about
  end

  def introduce
    @equipments = Equipment.all
  end

  def search
  end
end
