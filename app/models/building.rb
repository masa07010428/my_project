class Building < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :entirety_usege_id, presence: true
  validates :entirety_floor, presence: true
  validates :basement_floor, presence: true
  validates :total_area, presence: true
  validates :total_capacity, presence: true
  validates :fire_use, presence: true

  belongs_to :entirety_usege
  has_many :information_by_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_floors, allow_destroy: true
  has_many :information_by_basement_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_basement_floors, allow_destroy: true
end

