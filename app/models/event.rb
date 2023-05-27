class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'

  validates :title, presence: true, length: { minimum: 5 }
  validates :description, presence: true    
  validates :date, presence: true
  validates :time, presence: true    
end
