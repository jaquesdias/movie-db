class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :ratings

  validate :user
  validate :category
  validates :title, presence: true
end
