class Project < ApplicationRecord
  belongs_to :user
  has_many :rooms
  has_many :participations
  has_many :tasks, through: :rooms
end
