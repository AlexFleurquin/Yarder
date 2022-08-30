class Room < ApplicationRecord
  belongs_to :project
  has_many :tasks

  has_many_attached :photos
end
