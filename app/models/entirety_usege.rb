class EntiretyUsege < ApplicationRecord
  has_many :buildings
  has_many :information_by_floors
  has_many :information_by_basement_floors

  def view_category_and_example
    self.category + "(" + self.example + ")"
  end
end