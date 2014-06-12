class Meetup < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :description

  has_many :attendees
  has_many :users, through: :attendees
  has_many :comments
end
