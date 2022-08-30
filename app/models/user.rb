class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :projects
  has_many :participations

  has_many :professionals_participations, through: :projects, source: :participations
  has_many :professionals, through: :professionals_participations, source: :user

  has_one_attached :photo
end
