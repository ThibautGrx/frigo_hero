class User < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :interests, dependent: :destroy
  has_many :interested_items, through: :interests, source: :item
  has_one :profile, dependent: :destroy

  validates :username,
            presence: { message: 'Nom d\'utilisateur non renseigné' },
            uniqueness: { case_sensitive: false }

  devise :database_authenticatable,
         :registerable,
         :confirmable,
         :recoverable,
         :rememberable,
         :validatable
        #  :trackable,

  devise :omniauthable, omniauth_providers: %i[google_oauth2]

  def login
    @login || username || email
  end

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    login = conditions.delete(:login)
    where(conditions).find_by(["lower(username) = :value OR lower(email) = :value", { value: login.strip.downcase }])
  end

  def self.from_google(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.username = auth.info.name
      user.password = Devise.friendly_token[0, 20]
    end
  end
end
