class Building < ApplicationRecord
  validates :name, presence: true
  validates :address, presence: true
  validates :entirety_usege_id, presence: { message: "を選択してください" }
  validates :building_type_id, presence: true

  belongs_to :user
  belongs_to :entirety_usege, optional: :true
  belongs_to :building_type
  belongs_to :fire_use
  has_many :information_by_floors, dependent: :destroy
  accepts_nested_attributes_for :information_by_floors, allow_destroy: true
end

