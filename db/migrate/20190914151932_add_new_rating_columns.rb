class AddNewRatingColumns < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :rating_average, :integer, null: false, default: 0
    add_reference :ratings, :user, index: true
  end
end
