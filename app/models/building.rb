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
end

