class User < ApplicationRecord
  has_many :events, foreign_key: "creator_id", class_name: "Event"

  has_many :event_attendees, foreign_key: "attendee_id", dependent: :destroy
  has_many :attended_events, through: :event_attendees, source: :event, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
end
