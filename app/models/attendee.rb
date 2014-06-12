class Attendee < ActiveRecord::Base
  validates :meetup_id, presence: true
  validates :user_id, presence: true, uniqueness: {scope: :meetup}

  belongs_to :user
  belongs_to :meetup
  has_many :comments
end
