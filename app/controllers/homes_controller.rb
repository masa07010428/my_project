class HomesController < ApplicationController
  def index
  end

  def about
  end

  def introduce
    @modals = Modal.all
  end

  def search
  end
end
