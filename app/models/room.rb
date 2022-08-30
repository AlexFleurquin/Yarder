class Room < ApplicationRecord
  ROOM_TYPES = ['Salon', 'Chambre(s)', 'Salle de bains ou toilettes', 'Cuisine']
  belongs_to :project
  has_many :tasks
  has_many_attached :photos
  validates :room_type, inclusion: { in: ROOM_TYPES }
end
