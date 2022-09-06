class Project < ApplicationRecord
  BUILDING_TYPES = ['Appartement', 'Maison', 'Immeuble']
  URGENCIES = ['Urgent', ' 1 mois < ', ' > 1 mois', 'Pas de date fixée']
  belongs_to :user
  has_many :rooms, dependent: :destroy
  has_many :participations, dependent: :destroy
  has_many :tasks, through: :rooms, dependent: :destroy
  has_one_attached :photo
  validates :name, :address, presence: true
  validates :construction_year, :budget, numericality: true
  validates :building_type, inclusion: { in: BUILDING_TYPES }
  validates :urgency, inclusion: { in: URGENCIES }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def assigned?(artisan)
    participations&.where(user: artisan)&.count != 0
  end
end
