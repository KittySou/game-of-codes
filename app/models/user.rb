class User < ApplicationRecord
  include Level
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_decks
  has_many :decks, through: :user_decks
  # has_many :racetracks
  has_one_attached :photo
  validates :first_name, presence: true
  validates :last_name, presence: true

  def multiplayer_label
    "<img src='#{photo.url}' class='avatar'> #{username}".html_safe
  end
end
