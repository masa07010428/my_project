class Building < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :entirety_usege_id, presence: { message: "を選択してください" }
  validates :entirety_floor, presence: { message: "を選択してください" }
  validates :basement_floor, presence: { message: "を選択してください" }
  validates :total_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fire_use, presence: true
  belongs_to :entirety_usege, optional: :true
  has_many :information_by_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_floors, allow_destroy: true
  has_many :information_by_basement_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_basement_floors, allow_destroy: true
end

