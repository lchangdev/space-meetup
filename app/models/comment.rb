class Comment < ActiveRecord::Base
  validates :meetup, presence: true
  validates :user, presence: true
  validates :body, presence: true

  belongs_to :user
  belongs_to :meetup
end
