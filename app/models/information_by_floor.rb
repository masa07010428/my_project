class InformationByFloor < ApplicationRecord
  validates :floor_number, presence: { message: "を選択してください" }
  validates :floor_usege, presence: { message: "を選択してください" }
  validates :floor_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :floor_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :windowless_id, presence: { message: "を選択してください" }
  validates_associated :building

  belongs_to :building
  belongs_to :windowless, optional: :true
end