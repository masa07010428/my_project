class InformationByFloor < ApplicationRecord
  validates :floor_number, presence: true
  validates :floor_usege, presence: true
  validates :floor_area, presence: true
  validates :floor_capacity, presence: true
  validates :windowless_id, presence: true
  validates_associated :building

  belongs_to :building
  belongs_to :windowless
end