class Idea < ApplicationRecord
  belongs_to :user
  has_many :pledges
  has_many :votes
end
