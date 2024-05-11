class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_rich_text :about_me
  has_many_attached :images
  has_many :sent_chat_requests, class_name: "ChatRequest", foreign_key: "user_id"
  has_many :recieved_chat_requests, class_name: "ChatRequest", foreign_key: "to_user_id"
  has_many :chat_users
  has_many :chats, through: :chat_users

  after_validation :reverse_geocode, if: -> { longitude.present? && latitude.present? }

  def full_name
    [first_name, last_name, email].compact.first(2).join(" ")
  end

  def initials
    [first_name&.first, last_name&.first, email.first(2)].compact.first(2).join
  end

  def location_set?
    latitude && longitude
  end

  def new_chat_requests
    recieved_chat_requests.where(accepted: nil)
  end

  reverse_geocoded_by :latitude, :longitude do |obj,geo|
    obj.city    = geo[0].data["address"]["city"]
    obj.zipcode = geo[0].data["address"]["postcode"]
    obj.country = geo[0].data["address"]["country"]
  end
end
