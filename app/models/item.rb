class Item < ApplicationRecord
  include Filterable

  belongs_to :user
  has_many :interests, dependent: :destroy
  has_many :interested_users, through: :interests, source: :user

  enumerize :category, in: %i[smallfridge mediumfridge largefridge]

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  has_one_attached :image

  validates :description, presence: { message: 'Vous devez ajouter une description !' }
  validates :address, presence: { message: 'Vous devez ajouter une adresse pour le lieu de retrait !' }
  validates :date, presence: { message: 'Vous devez ajouter une date !' }
end
