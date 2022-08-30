class Project < ApplicationRecord
  BUILDING_TYPES = ['Appartement', 'Maison']
  URGENCIES = ['Urgent', 'Dans moins d\'un mois', 'Dans plus d\'un mois', 'Pas de date fixée']
  belongs_to :user
  has_many :rooms
  has_many :participations
  has_many :tasks, through: :rooms
  has_one_attached :photo
  validates :name, :address, presence: true
  validates :construction_year, :budget, numericality: true
  validates :building_type, inclusion: { in: BUILDING_TYPES }
  validates :urgency, inclusion: { in: URGENCIES }
end
