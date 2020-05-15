class Building < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :entirety_usege_id, presence: { message: "を選択してください" }
  validates :entirety_floor, presence: { message: "を選択してください" }
  validates :basement_floor, presence: { message: "を選択してください" }
  validates :total_area, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :total_capacity, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :fire_use, presence: true
  validate :entirety_floor_matches_last_floor_number
  validate :entirety_floor_matches_number_of_information_by_floor
  validate :when_basement_floor_selected
  validate :basement_floor_matches_last_basement_floor_number

  private
  def entirety_floor_matches_last_floor_number
    if entirety_floor != information_by_floors.last.floor_number
      errors.add(:entirety_floor, "と階別情報の最後に選択した階数を一致させてください")
    end
  end

  def entirety_floor_matches_number_of_information_by_floor
    if entirety_floor != information_by_floors.length
      errors.add(:entirety_floor, "と階別情報の数は一致させてください")
    end
  end

  def when_basement_floor_selected
    if (basement_floor == 1 || 2 || 3) && (information_by_basement_floors.blank?)
      errors.add(:basement_floor, "を選択した場合は、階情報を入力してください")
    end
  end

  def basement_floor_matches_last_basement_floor_number
    if (information_by_basement_floors.present?) && (basement_floor != information_by_basement_floors.last.floor_number)
      errors.add(:basement_floor, "と階別情報の最後に選択した階数を一致させてください")
    end
  end

  belongs_to :entirety_usege, optional: :true
  has_many :information_by_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_floors, allow_destroy: true
  has_many :information_by_basement_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_basement_floors, allow_destroy: true
end

