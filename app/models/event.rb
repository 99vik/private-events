class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  has_many :event_attendees, foreign_key: "event_id", dependent: :destroy
  has_many :attendees, through: :event_attendees, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true    
  validates :date, presence: true
  validates :time, presence: true    
end
