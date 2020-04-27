class EntiretyUsege < ApplicationRecord
  has_many :buildings

  def view_category_and_example
    self.category + "(" + self.example + ")"
  end
end