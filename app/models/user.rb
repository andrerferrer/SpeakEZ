class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :appointments_as_asker, class_name: "Appointment", foreign_key: :asker_id
  has_many :appointments_as_receiver, class_name: "Appointment", foreign_key: :receiver_id
  has_many :user_languages, dependent: :destroy
  has_many :languages, through: :user_languages
  has_many :messages
  has_one_attached :photo
  validates :username, presence: true, uniqueness: true
  validates :first_name, :last_name, :phone, :nationality, :age, :location, presence: true
  validates :age,  numericality: { only_integer: true }
  validates :bio, length: {minimum: 5, maximum: 1000}, allow_blank: true
end
