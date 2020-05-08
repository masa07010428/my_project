class InformationByBasementFloor < ApplicationRecord
  validates :floor_number, presence: true
  
  belongs_to :building, optional: :true
end
