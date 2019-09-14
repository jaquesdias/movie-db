class Rating < ApplicationRecord
  belongs_to :movie

  validates :rating_value, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

  after_save :update_movie_rating

  private

  def update_movie_rating
    rating_average = Rating.where(movie_id: movie_id).average(:rating_value).to_i
    Movie.find(movie_id).update(rating_average: rating_average)
  end
end
