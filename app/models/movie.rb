class Movie < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :ratings

  validates :title, presence: true

  def blank_stars
    5 - rating_average
  end
end
