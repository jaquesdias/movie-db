class Category < ApplicationRecord
  has_many :movies, dependent: :destroy
end
