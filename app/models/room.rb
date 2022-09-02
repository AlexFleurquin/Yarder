class Room < ApplicationRecord
  ROOM_TYPES = ['Salon', 'Chambre', 'Salle de bains ou toilettes', 'Cuisine']
  belongs_to :project
  has_many :tasks, dependent: :delete_all
  has_many_attached :photos
  validates :room_type, inclusion: { in: ROOM_TYPES }
end
