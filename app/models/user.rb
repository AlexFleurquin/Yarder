class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:google_oauth2]

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

  def self.from_omniauth(access_token)
    data = access_token.info
    user = User.where(email: data['email']).first

    # Uncomment the section below if you want users to be created if they don't exist
    unless user
      user = User.create(name: data['name'],
        email: data['email'],
        password: Devise.friendly_token[0,20]
      )
    end
    user
  end
end
