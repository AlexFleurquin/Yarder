class Project < ApplicationRecord
  BUILDING_TYPES = ['Appartement', 'Maison', 'Immeuble']
  URGENCIES = ['Urgent', ' 1 mois < ', ' > 1 mois', 'Pas de date fixée']
  belongs_to :user
  has_many :rooms
  has_many :participations
  has_many :tasks, through: :rooms
  has_one_attached :photo
  validates :name, :address, presence: true
  validates :construction_year, :budget, numericality: true
  validates :building_type, inclusion: { in: BUILDING_TYPES }
  validates :urgency, inclusion: { in: URGENCIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
