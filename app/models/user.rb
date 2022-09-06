class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :projects
  has_many :participations

  has_many :professionals_participations, through: :projects, source: :participations
  has_many :professionals, through: :professionals_participations, source: :user

  has_many :chatrooms_as_client, class_name: "Chatroom", foreign_key: :client_id
  has_many :chatrooms_as_professional, class_name: "Chatroom", foreign_key: :professional_id

  has_one_attached :photo

  scope :artisans, -> { where(is_pro: true) }

  def full_name
    [first_name.capitalize, last_name.capitalize].join(" ")
  end
end
