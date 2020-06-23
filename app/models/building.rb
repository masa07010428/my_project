class Building < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :entirety_usege_id, presence: { message: "を選択してください" }
  validates :building_type_id, presence: true
  validates :fire_use_id, presence: true
  # 以下は修正予定のため、残しています。
  # validate :entirety_floor_matches_last_floor_number
  # validate :entirety_floor_matches_number_of_information_by_floor

  # private
  # def entirety_floor_matches_last_floor_number
  #   if entirety_floor != information_by_floors.last.floor_number
  #     errors.add(:entirety_floor, "と階別情報の最後に選択した階数を一致させてください")
  #   end
  # end

  # def entirety_floor_matches_number_of_information_by_floor
  #   if entirety_floor != information_by_floors.length
  #     errors.add(:entirety_floor, "と階別情報の数は一致させてください")
  #   end
  # end

  belongs_to :entirety_usege, optional: :true
  belongs_to :building_type
  belongs_to :fire_use
  has_many :information_by_floors, inverse_of: :building, dependent: :destroy
  accepts_nested_attributes_for :information_by_floors, allow_destroy: true
  has_many :information_by_basement_floors, inverse_of: :building, dependent: :destroy
  accepts_nested_attributes_for :information_by_basement_floors, allow_destroy: true
end

